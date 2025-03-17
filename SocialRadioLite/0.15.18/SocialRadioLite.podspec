Pod::Spec.new do |s|
  s.name             = 'SocialRadioLite'
  s.version          = '0.15.18'
  s.summary          = 'This library contains the Pacemaker Radio Engine and exposes functions to use it.'
  s.description      = 'This library contains the Pacemaker Radio Engine and exposes functions to use it.'
  s.homepage         = 'https://www.tunedglobal.com'
  s.license          = { :type => 'MIT', :file => 'builds/SocialRadioLite/0.15.18/SocialRadioLite-LICENSE' }
  s.author           = { 'vic' => 'victor.garcia@tunedglobal.com' }
  s.source           = { :git => 'https://github.com/tunedglobal/tunedglobalpublic-ios-frameworks.git',
                         :tag => 'SocialRadioLite/' + s.version.to_s,
                         :submodules => true }
  s.dependency 'glm', '~>0.9.4.3'
  s.dependency 'OpenSSL-Universal', '~>1.1.1900'
  s.frameworks = 'Accelerate', 'AudioToolbox', 'Security', 'AVFoundation', 'SafariServices', 'MessageUI'
  s.vendored_frameworks = "builds/SocialRadioLite/0.15.18/SocialRadioLite.xcframework"
  s.platform = :ios
  s.swift_version    = '5.5'
  s.ios.deployment_target  = '13.0'
  s.requires_arc = true
end
