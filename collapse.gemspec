Gem::Specification.new do |s|
  s.name = "collapse"
  s.version = "0.0.1"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Michael Avila"]
  s.email = ["me at michaelavila.com"]
  s.homepage = "http://github.com/michaelavila/collapse"
  s.summary = %q{Collapse directories}
  s.description = %q{Collapse directories}
  s.rubyforge_project = "collapse"
  s.files = ["lib/collapse.rb"]
  s.add_development_dependency("cucumber")
  s.add_development_dependency("aruba")
end
