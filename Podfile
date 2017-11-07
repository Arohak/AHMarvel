# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

target 'Marvel' do
  use_frameworks!

  plugin 'cocoapods-keys', {
    :project => "Marvel",
    :target => "Marvel",
    :keys => [
      "MarvelApiKey",
      "MarvelPrivateKey"
    ]}

   pod 'SwiftGen'
   pod 'RxSwift'
   pod 'Moya/RxSwift'
   pod 'Moya-ObjectMapper/RxSwift'
   pod 'CryptoSwift'
   pod 'Dollar'
   pod 'Kingfisher'
   pod 'Reusable'
end

target 'MarvelTests' do
    use_frameworks!
    
    pod 'Quick'
    pod 'Nimble'
    pod 'Fakery'
    pod 'ObjectMapper'
end

#post_install do |installer|
#  installer.pods_project.targets.each do |target|
#    target.build_configurations.each do |config|
#      config.build_settings['SWIFT_VERSION'] = '4.0'
#    end
#  end
#end

