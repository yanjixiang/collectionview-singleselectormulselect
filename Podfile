source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
platform:ios,'11.0'
#use_frameworks!

target 'collectionView横向滑动多选' do
    
  pod 'Masonry'
  pod 'SDWebImage'


end

##################加入代码##################
# 使用第三方库xcode报错Cannot synthesize weak property because the current deployment target does not support weak references
post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
end
end
end
##################加入代码##################