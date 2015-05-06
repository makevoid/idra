path = File.expand_path "../", __FILE__
require "#{path}/version"

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'idra'
  s.version      = Mygem::VERSION
  s.summary      = 'Idra is a tiny wrapper around Typoheus Hydra to make concurrent http requests even simpler.'
  s.description  = 'Tiny wrapper around Typoheus Hydra to make concurrent http requests even simpler. Usually you don\'t need this, the Typoheus API itself is very good ( https://github.com/typhoeus/typhoeus#making-parallel-requests ), but I like to have an even slimmer API :)'

  s.author       = "Francesco 'makevoid' Canessa"
  s.email        = 'makevoid@gmail.com'
  s.homepage     = 'http://github.com/makevoid?tab=repositories'

  s.files        = Dir['Readme.md', 'lib/**/*']
  s.require_path = 'lib'
end
