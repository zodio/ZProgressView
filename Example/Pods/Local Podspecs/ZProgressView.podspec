Pod::Spec.new do |s|
  s.name             = "ZProgressView"
  s.version          = File.read('VERSION')
  s.summary          = "A simple UIView-based progress view with the ability to add stops."
  s.description      = <<-DESC
                       An optional longer description of ZProgressView

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "http://github.com/zodio/ZProgressView"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jai Govindani" => "govindani@gmail.com" }
  s.source           = { :git => "http://EXAMPLE/NAME.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EXAMPLE'

  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}'
  s.resources = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
