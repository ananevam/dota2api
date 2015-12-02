$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dota2api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dota2api"
  s.version     = Dota2api::VERSION
  s.authors     = ["Ananev Alexander"]
  s.email       = ["minoru.null@gmail.com"]
  s.homepage    = "https://github.com/ananevam/dota2api"
  s.summary     = "Ruby client for the Dota 2 WebAPI."
  s.description = "Ruby client for the Dota 2 WebAPI."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "mini_magick"

end
