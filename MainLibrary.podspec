Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "MoneyOnMobileSDK"
s.summary = "MoneyOnMobileSDK lets a user select features"
s.requires_arc = true

# 2
s.version = "0.1.1"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Basheer Ahamed" => "mca.basheer@gmail.com" }

# For example,
# s.author = { "Joshua Greene" => "jrg.developer@gmail.com" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/mcabasheer/MainLibrary"

# For example,
# s.homepage = "https://github.com/mcabasheer/MainLibrary"


# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/mcabasheer/MainLibrary.git", :tag => "#{s.version}"}

# For example,
# s.source = { :git => "https://github.com/mcabasheer/MainLibrary.git", :tag => "#{s.version}"}


# 7
s.framework = "UIKit"
s.dependency 'FBSDKCoreKit'
s.dependency 'FBSDKShareKit'
s.dependency 'FBSDKLoginKit'
s.dependency 'Fabric'
s.dependency 'TwitterKit'
s.dependency 'GoogleSignIn'

# 8
s.source_files = "MoneyOnMobileSDK/**/*.{swift}"

# 9
s.resources = "MoneyOnMobileSDK/**/*.{png,jpeg,jpg,storyboard,xib}"
end