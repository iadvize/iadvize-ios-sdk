Pod::Spec.new do |spec|
  spec.name                     = 'iAdvize'
  spec.version                  = '3.0.0-beta1'
  spec.license                  = { :type => 'Proprietary', :file => 'LICENSE.md' }
  spec.homepage                 = 'https://github.com/iadvize/iadvize-ios-sdk'
  spec.authors                  = { 'iAdvize' => 'mobile@iadvize.com' }
  spec.summary                  = 'iAdvize - iOS Conversation SDK'
  spec.description              = 'Embed the iAdvize Conversation SDK in your app and connect your visitors with your professional agents or ibbü experts through a fully customised chat experience.'
  spec.source                   = { :http => "https://github.com/iadvize/iadvize-ios-sdk/releases/download/#{spec.version}/IAdvizeSDK.zip" }

  spec.platform                 = :ios, '13.0'
  spec.swift_version            = '5.0'

  spec.ios.vendored_frameworks  = 'IAdvizeConversationSDK.xcframework'
end
