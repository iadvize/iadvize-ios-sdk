Pod::Spec.new do |spec|
  spec.name                     = 'iAdvize'
  spec.version                  = '1.0.0'
  spec.license                  = { :type => 'Proprietary', :file => 'LICENSE.md' }
  spec.homepage                 = 'https://github.com/iadvize/iadvize-ios-sdk'
  spec.authors                  = { 'Name' => 'sdk-integration@iadvize.com' }
  spec.summary                  = 'iAdvize - iOS Conversation SDK'
  spec.source                   = { :http => "http://github.com/iadvize/iadvize-ios-sdk/releases/download/#{spec.version}/IAdvizeConversationSDK.cocoapods.zip" }
  spec.platform                 = :ios, '9.3'

  spec.swift_version            = '4.1'

  spec.ios.vendored_frameworks  = 'IAdvizeConversationSDK.framework'

  spec.dependency 'MessageKit'
  spec.dependency 'Apollo', '0.8'
  spec.dependency 'JSONWebToken'
end
