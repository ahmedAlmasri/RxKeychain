#
# Be sure to run `pod lib lint RxKeychain.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxKeychain'
  s.version          = '0.1.3'
  s.summary          = 'Wrapper for the iOS Keychain written in RxSwift'
  s.description      = <<-DESC
  Use SwiftKeychainWrapper to Keychain in RxSwift
                       DESC
					   
  s.module_name = "RxKeychain"
  s.homepage         = 'https://github.com/ahmedAlmasri/RxKeychain'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ahmed.almasri@ymail.com' => 'ahmed.almasri@ymail.com' }
  s.source           = { :git => 'https://github.com/ahmedAlmasri/RxKeychain.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.swift_version = ['4.2', '5.0']
  s.source_files = 'RxKeychain/Classes/**/*.swift'
  s.dependency 'RxSwift'
end
