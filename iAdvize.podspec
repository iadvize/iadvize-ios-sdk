Pod::Spec.new do |spec|
  spec.name                     = 'iAdvize'
  spec.version                  = '2.5.0'
  spec.license                  = { :type => 'Proprietary', :file => 'LICENSE.md' }
  spec.homepage                 = 'https://github.com/iadvize/iadvize-ios-sdk'
  spec.authors                  = { 'iAdvize' => 'mobile@iadvize.com' }
  spec.summary                  = 'iAdvize - iOS Conversation SDK'
  spec.description              = 'Embed the iAdvize Conversation SDK in your app and connect your visitors with your professional agents or ibbü experts through a fully customised chat experience.'
  spec.source                   = { :http => "https://github.com/iadvize/iadvize-ios-sdk/releases/download/#{spec.version}/IAdvizeConversationSDK.cocoapods.zip" }
  spec.platform                 = :ios, '12.0'

  spec.swift_version            = '5.0'

  spec.ios.vendored_frameworks  = 'IAdvizeConversationSDK.xcframework'

  spec.dependency 'Apollo', '~> 0.36.0'
  spec.dependency 'Apollo/SQLite'
  spec.dependency 'JWTDecode', '~> 2.6.3'
  spec.dependency 'SwiftGraylog', '~> 1.1.1'
  spec.dependency 'Gifu', '~> 3.3.0'
  spec.dependency 'XMPPFramework/Swift', '~> 4.0.0'
  spec.dependency 'TwilioVideo', '~> 4.6'
end
