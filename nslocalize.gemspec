$:.unshift File.expand_path('../lib', __FILE__)
require 'nslocalize/version'

Gem::Specification.new do |gem|
  gem.name                    =  'nslocalize'
  gem.version                 =  NSLocalize::VERSION
  gem.date                    =  '2013-04-08'

  gem.author                  =  'Gabriel Rinaldi'
  gem.email                   =  'gabriel@gabrielrinaldi.me'
  gem.homepage                =  'http://gabrielrinaldi.me/gems/nslocalize'

  gem.summary                 =  'Manage and localize strings with easy on iOS.'
  gem.description             =  'Easily parse project files and upload them to NSLocalize.'
  gem.license                 =  'MIT'

  gem.files                   = `git ls-files`.split("\n")
  gem.test_files              = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables             = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  # gem.files                   =   %x{ ls -1F }.split("\n").select { |d| d =~ %r{^(License|README|bin/|lib/|test/)} }
  # gem.executables             << 'nslocalize'

  gem.post_install_message    =  'Thanks for installing!'

  gem.add_runtime_dependency     'trollop', '~> 2.0'
end
