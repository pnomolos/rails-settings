require 'rubygems'
require 'rake'
require 'rake/gempackagetask'

NAME = "rails-settings"
AUTHOR = "Felix McCoey, Philip Schalm"
EMAIL = "pnomolos@gmail.com"
HOMEPAGE = ""
SUMMARY = "RailsSettings, settings for your Rails"
GEM_VERSION = "0.0.1"

spec = nil
File.open('rails-settings.gemspec', 'r'){|f| spec = eval(f.read)}

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install RailsSettings as a gem"
task :install => [:package] do
  sh %{#{sudo} gem install pkg/#{NAME}-#{GEM_VERSION} --no-update-sources}
end

namespace :jruby do
  desc "Run :package and install the resulting .gem with jruby"
  task :install => :package do
    sh %{#{sudo} jruby -S gem install #{install_home} pkg/#{NAME}-#{GEM_VERSION}.gem --no-rdoc --no-ri}
  end
end
