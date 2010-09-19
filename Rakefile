require 'rubygems'
require 'rake/gempackagetask'
require 'merb-core/version'
require 'merb-core/tasks/merb_rake_helper'

NAME = "merb-settings"
AUTHOR = "Felix McCoey"
EMAIL = "felix.mccoey@gmail.com"
HOMEPAGE = ""
SUMMARY = "MerbSettings, settings for your Merb"
GEM_VERSION = "0.0.1"

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'merb'
  s.name = NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('merb-slices', '>= 0.9.4')
  s.add_dependency('dm-timestamps', '>= 0.9.4')
  s.add_dependency('dm-validations', '>= 0.9.4')
  s.add_dependency('yaml')
  s.require_path = 'lib'
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,public,stubs}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install MerbSettings as a gem"
task :install => [:package] do
  sh %{#{sudo} gem install pkg/#{NAME}-#{GEM_VERSION} --no-update-sources}
end

namespace :jruby do

  desc "Run :package and install the resulting .gem with jruby"
  task :install => :package do
    sh %{#{sudo} jruby -S gem install #{install_home} pkg/#{NAME}-#{GEM_VERSION}.gem --no-rdoc --no-ri}
  end
  
end
