require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'rails-settings'
    gem.summary = 'A nice little settings plugin for Rails'
    gem.email = 'pnomolos@gmail.com'
    gem.homepage = 'http://github.com/pnomolos/rails-settings'
    gem.authors = ['Philip Schalm', 'Felix McCoey']
    gem.files = Dir['*','{lib}/**/*']
    gem.add_dependency('dm-timestamps', '>= 0.9.4')
    gem.add_dependency('dm-validations', '>= 0.9.4')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end