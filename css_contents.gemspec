$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "css_contents/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "css_contents"
  s.version     = CssContents::VERSION
  s.authors     = ["Scott Block"]
  s.email       = ["scottrblock@gmail.com"]
  s.summary     = "CSS TOC Genertor."
  s.description = "Generate table of contents for sass files."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1"

end
