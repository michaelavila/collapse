require 'cucumber'
require 'cucumber/rake/task'
require 'rubygems/package_task'

Cucumber::Rake::Task.new(:features) do |t|
    t.cucumber_opts = "features --format pretty"
end

spec = eval(File.read('collapse.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
end

task :default => [:features]
