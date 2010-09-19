Gem::Specification.new do |s|
  s.rubyforge_project = 'rails'
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
  s.add_runtime_dependency('dm-timestamps', '>= 0.9.4')
  s.add_runtime_dependency('dm-validations', '>= 0.9.4')
  s.add_runtime_dependency('yaml')
  s.require_path = 'lib'
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,public,stubs}/**/*")
end