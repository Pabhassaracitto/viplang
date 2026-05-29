# Podfile for VipLang iOS project

post_install_path = File.expand_path('Flutter/podhelper.rb', __dir__)
require post_install_path

platform :ios, '13.0'

# CocoaPods analytics sends usage stats so we can improve the tool.
install! 'cocoapods', :deterministic_uuids => false

target 'Runner' do
  use_frameworks!
  use_modular_headers!

  flutter_install_all_ios_pods File.dirname(File.realpath(__FILE__))

  target 'RunnerTests' do
    inherit! :search_paths
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    target.build_configurations.each do |config|
      # Force setting the deployment target to iOS 13.0 for all CocoaPods dependencies
      # to prevent Xcode compilation errors (such as -G option unsupported for older iOS targets)
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      puts "  [VipLang Podfile] Forcing IPHONEOS_DEPLOYMENT_TARGET to 13.0 for target '#{target.name}' configuration '#{config.name}'"
    end
  end
end
