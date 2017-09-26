# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!
target 'GDAXBar' do
  # Pods here
end

target 'GDAXBarTests' do
  inherit! :search_paths
end

def gdax_framework_pods
  pod 'Moya'
end

target 'GDAX' do
  gdax_framework_pods
end

target 'GDAXTests' do
  gdax_framework_pods
end

