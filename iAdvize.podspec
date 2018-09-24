Pod::Spec.new do |spec|
  spec.name          = 'iAdvize'
  spec.version       = '1.0.0'
  spec.homepage      = 'https://github.com/iadvize/iadvize-ios-sdk'
  spec.authors       = { 'Name' => 'sdk-integration@iadvize.com' }
  spec.summary       = 'iAdvize - iOS Conversation SDK'
  spec.source        = { :http => 'https://github.com/iadvize/iadvize-ios-sdk/tree/master/IAdvizeConversationSDK.framework' }
  spec.platform      = :ios, '9.3'

  spec.ios.vendored_frameworks = 'IAdvizeConversationSDK.framework'

  spec.dependency 'MessageKit'
  spec.dependency 'Apollo', '0.8'
  spec.dependency 'JSONWebToken'
end
