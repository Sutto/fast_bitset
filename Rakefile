require "bundler/gem_tasks"
require "rake/extensiontask"
require 'rspec/core/rake_task'

Rake::ExtensionTask.new("fast_bitset") do |ext|
  ext.lib_dir = "lib/fast_bitset"
end

RSpec::Core::RakeTask.new(:spec)
task default: [:compile, :spec]