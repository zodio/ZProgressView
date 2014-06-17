Pod::Spec.new do |s|
  s.name             = "ZProgressView"
  s.version          = File.read('VERSION')
  s.summary          = "A simple UIView-based progress view with the ability to add stops."
  s.description      = <<-DESC
					   A simple UIView-based progress view with the ability to add stops.

					   I created this progress view for the [Zodio iPhone app](http://i.zodio.com) - when we added video reviews, I needed a way to indicate the minimum recording duration needed - the ability to add a 'stop' basically that visually represented milestones/markers on the progress view.

					   Stops can be added and removed dynamically after the progress view has been init'ed. Here's what it looks like:

					   ![screenshot-1](https://github.com/zodio/ZProgressView/Screenshots/ZProgressView-screenshot1.png)
                       DESC
  s.homepage         = "https://github.com/zodio/ZProgressView"
  s.license          = 'MIT'
  s.author           = { "Jai Govindani" => "govindani@gmail.com" }
  s.source           = { :git => "https://github.com/zodio/ZProgressView.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/govindani'

  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.requires_arc = true

  s.source_files = 'Classes/**/*.{h,m}'
  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'

end
