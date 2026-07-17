# Fork of the public TrueTime 5.0.3 podspec, published to PMPrivatePods.
#
# Upstream (https://github.com/instacart/TrueTime.swift) declares an iOS 8.0
# deployment target. Under Xcode 14.3+ that makes clang link libarclite for the
# pod's ARC Objective-C sources, and the toolchain no longer ships it:
#   clang: error: SDK does not contain 'libarclite' ...; try increasing the
#   minimum deployment target
# That breaks validation of every pod depending on TrueTime (AutomixIQ,
# SocialRadio, SocialRadioLite). A dependent podspec cannot override a
# dependency's build settings, so the spec itself has to be patched.
#
# Only the platforms differ from upstream; source still points at the unmodified
# upstream 5.0.3 tag, so no third-party code is redistributed here. Upstream also
# supports macOS and tvOS; this fork is iOS-only because that is all the
# Pacemaker SDKs ship, and validating tvOS requires a tvOS simulator to be
# installed on whichever machine runs the push.
#
# Version 5.0.3.1 sorts above the public 5.0.3, so `s.dependency 'TrueTime'`
# resolves here without pinning, and the fourth segment will not collide with a
# future upstream release.
#
# Publish with:
#   pod repo push PMPrivatePods vendor/podspecs/TrueTime.podspec --allow-warnings \
#     --sources=tunedglobal@vs-ssh.visualstudio.com:v3/tunedglobal/Pacemaker/PMPrivatePods,https://github.com/CocoaPods/Specs.git

Pod::Spec.new do |s|
  s.name             = 'TrueTime'
  s.version          = '5.0.3.1'
  s.summary          = 'NTP library for Swift. Get the true time impervious to device clock changes.'
  s.homepage         = 'https://github.com/instacart/TrueTime.swift'
  s.license          = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.authors          = { 'Michael Sanders' => 'msanders@instacart.com' }
  s.source           = { :git => 'https://github.com/instacart/TrueTime.swift.git', :tag => '5.0.3' }
  s.swift_versions   = '5.0'
  s.requires_arc     = true
  s.ios.deployment_target = '14.0'
  s.source_files     = 'Sources/*.{swift,h,m}', 'Sources/CTrueTime/*.h'
  s.public_header_files = 'Sources/*.h'
  s.pod_target_xcconfig = { 'SWIFT_INCLUDE_PATHS' => '$(SRCROOT)/TrueTime/Sources/CTrueTime/**' }
  s.preserve_paths   = 'Sources/CTrueTime/module.modulemap'
end
