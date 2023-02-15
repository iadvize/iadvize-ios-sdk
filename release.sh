#!/bin/bash

# Exit script at first error:
set -e

function printHelp() {
  echo ""
  echo "USAGE: release.sh <command>"
  echo "    help"
  echo "        Prints this message"
  echo ""
  echo "    start"
  echo "        Starts the release process."
  echo ""
  echo "    finish"
  echo "        Ends a previously started release process."
}

function checkArtifact() {
  if [ -f "IAdvizeSDK.zip" ]; then
    echo -e "\033[1;42m => Found release artifact. Unzipping. \033[0m"
    rm -Rf tmp
    unzip -q IAdvizeSDK.zip -d tmp

    echo -e "\033[1;42m => Extracting version name \033[0m"
    versionName=$(grep "spec.version" tmp/iAdvize.podspec -m 1 | sed "s/  spec.version                  = '\(.*\)'/\1/")
  else
    echo -e "\033[1;101m No release artifact found. \033[0m"
    exit 1
  fi
}

function updateReleaseFiles() {
  echo -e "\033[1;42m => Updating podspec \033[0m"
  cp tmp/iAdvize.podspec iAdvize.podspec
  cp tmp/Package.swift Package.swift

  echo -e "\033[1;42m => Updating CHANGELOG, UPGRADING & README. \033[0m"
  mv tmp/CHANGELOG.md CHANGELOG.md
  mv tmp/UPGRADING.md UPGRADING.md
  mv tmp/README.md README.md

  echo -e "\033[1;42m => Updating documentation \033[0m"
  rm -rf docs
  mv tmp/docs docs
}

function printStartSuccess() {
  echo -e "\033[1;42m => Release ${versionName} is applied! This is what remains for you to do: \033[0m"
  echo -e "\033[1;95m - Test the sample project locally with this release \033[0m"
  echo -e "\033[1;95m - Execute './release.sh finish' to continue the release process \033[0m"
}

function checkCurrentRelease() {
  if [ -d "tmp" ]; then
    echo -e "\033[1;42m => Extracting version name \033[0m"
    versionName=$(grep "spec.version" tmp/iAdvize.podspec -m 1 | sed "s/  spec.version                  = '\(.*\)'/\1/")
  else
    echo -e "\033[1;101m No ongoing release found. \033[0m"
    exit 1
  fi
}

function requestFinishApproval() {
  echo -e "\033[1;31m WARNING - You are about to push release ${versionName} to the public repository. \033[0m"
  echo -e "\033[1;31m Proceed ? [y/n] \033[0m"
  read -s -n 1 key
  case $key in
    y) ;;
    *)
      exit 0
  esac
}

function commitPushRelease() {
  echo -e "\033[1;42m => Committing/pushing version update \033[0m"
  git add --all
  git commit -m "(build) publish version ${versionName}" --quiet
  git tag "${versionName}"
  git push origin master --tags
}

function cleanRelease() {
  rm -R tmp
  rm IAdvizeSDK.zip
}

function printFinishSuccess() {
  echo -e "\033[1;42m => Release ${versionName} is now public! This is what remains for you to do: \033[0m"
  echo -e "\033[1;95m - Create a github release from tag ${versionName} : https://github.com/iadvize/iadvize-ios-sdk/releases/new \033[0m"
  echo -e "\033[1;95m - Fill description with changelog info and add IAdvizeSDK.zip & checksum files to the release \033[0m"
}

if [[ "$1" == "start" ]]; then
  checkArtifact
  updateReleaseFiles
  printStartSuccess
elif [[ "$1" == "finish" ]]; then
  checkCurrentRelease
  requestFinishApproval
  commitPushRelease
  cleanRelease
  printFinishSuccess
else
  printHelp
fi
