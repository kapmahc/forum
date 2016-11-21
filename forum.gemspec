$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'forum/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'forum'
  s.version     = Forum::VERSION
  s.authors     = ['Jitang Zheng']
  s.email       = ['jitang.zheng@gmail.com']
  s.homepage    = 'https://github.com/kapmahc/forum'
  s.summary     = 'forum engine'
  s.description = 'forum'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.0', '>= 5.0.0.1'

  s.add_development_dependency 'sqlite3'
end
