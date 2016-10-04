Pod::Spec.new do |s|
  s.name = 'UICollectionViewToolsSwift'
  s.version = '1.0'
  s.license = 'MIT'
  s.summary = 'A Collection of tools for UICollectionViews/UITableViews using swift'
  s.homepage = 'https://github.com/JeanVinge/UICollectionViewToolsSwift'
  s.social_media_url = 'http://twitter.com/jean_vinge'
  s.authors = { 'Jean Vinge' => 'jean_vinge@hotmail.com' }
  s.source = { :git => 'https://github.com/JeanVinge/UICollectionViewToolsSwift.git', :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.source_files = 'UICollectionViewToolsSwift/Source/*.swift'
end
