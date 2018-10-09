Pod::Spec.new do |spec|
  spec.name                     = 'iAdvize'
  spec.version                  = '1.0.2'
  spec.license                  = { :type => 'Proprietary', :file => 'LICENSE.md' }
  spec.homepage                 = 'https://github.com/iadvize/iadvize-ios-sdk'
  spec.authors                  = { 'iAdvize' => 'sdk-integration@iadvize.com' }
  spec.summary                  = 'iAdvize - iOS Conversation SDK'
  spec.description              = 'Embed the iAdvize Conversation SDK in your app and connect your visitors with your professional agents or ibbü experts through a fully customised chat experience.'
  spec.source                   = { :http => "https://github.com/iadvize/iadvize-ios-sdk/releases/download/#{spec.version}/IAdvizeConversationSDK.cocoapods.zip" }
  spec.platform                 = :ios, '9.3'

  spec.swift_version            = '4.1'

  spec.ios.vendored_frameworks  = 'IAdvizeConversationSDK.framework'

  spec.dependency 'MessageKit', '~> 1.0.0'
  spec.dependency 'Apollo', '~> 0.9.3'
  spec.dependency 'JSONWebToken', '~> 2.2.0'
end
