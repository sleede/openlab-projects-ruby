$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "openlab/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openlab_ruby"
  s.version     = Openlab::VERSION
  s.authors     = ["Nicolas Florentin"]
  s.email       = ["nicolas@sleede.com"]
  s.homepage    = ""
  s.summary     = "Openlab is an api wrapper for Openlab api"
  s.description = "Openlab is an api wrapper for Openlab api"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "httparty", "~> 0.13"
end
