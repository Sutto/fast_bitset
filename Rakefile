require "bundler/gem_tasks"
require "rake/extensiontask"
require 'rspec/core/rake_task'


# This is from https://github.com/andremedeiros/ruby-deepclone/blob/master/Rakefile
def gemspec
  @clean_gemspec ||= eval(File.read(File.dirname(__FILE__) + '/fast_bitset.gemspec'))
end


Rake::ExtensionTask.new("fast_bitset", gemspec) do |ext|
  ext.lib_dir = "lib/fast_bitset"
end

RSpec::Core::RakeTask.new(:spec)
task default: [:compile, :spec]