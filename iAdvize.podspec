Pod::Spec.new do |spec|
  spec.name                     = 'iAdvize'
  spec.version                  = '1.6.4'
  spec.license                  = { :type => 'Proprietary', :file => 'LICENSE.md' }
  spec.homepage                 = 'https://github.com/iadvize/iadvize-ios-sdk'
  spec.authors                  = { 'iAdvize' => 'sdk-integration@iadvize.com' }
  spec.summary                  = 'iAdvize - iOS Conversation SDK'
  spec.description              = 'Embed the iAdvize Conversation SDK in your app and connect your visitors with your professional agents or ibbü experts through a fully customised chat experience.'
  spec.source                   = { :http => "https://github.com/iadvize/iadvize-ios-sdk/releases/download/#{spec.version}/IAdvizeConversationSDK.cocoapods.zip" }
  spec.platform                 = :ios, '9.3'

  spec.swift_version            = '5.0'

  spec.ios.vendored_frameworks  = 'IAdvizeConversationSDK.framework'

  spec.dependency 'MessageKit', '~> 3.0.0'
  spec.dependency 'Apollo', '~> 0.16.0'
  spec.dependency 'JWT', '~> 3.0.0-beta.11'
  spec.dependency 'SwiftGraylog', '~> 1.1.1'
  spec.dependency 'AlamofireImage', '~> 3.5.2'
  spec.dependency 'Gifu', '~> 3.2.0'
end

