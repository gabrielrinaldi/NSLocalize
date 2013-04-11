# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts %Q\Run "bundle install" to install missing gems\
  exit e.status_code
end

require 'rake'
require 'jeweler'

Jeweler::Tasks.new do |gem|
  gem.name                    = 'nslocalize'

  gem.author                  = 'Gabriel Rinaldi'
  gem.email                   = 'gabriel@gabrielrinaldi.me'
  gem.homepage                = 'http://github.com/gabrielrinaldi/nslocalize'

  gem.summary                 = %Q{Manage and localize strings with easy on iOS.}
  gem.description             = %Q{Easily parse project files and upload them to NSLocalize.}
  gem.license                 = 'MIT'

  gem.executables             = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }

  gem.post_install_message    =  'Thanks for installing!'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = %Q\nslocalize #{version}\
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
