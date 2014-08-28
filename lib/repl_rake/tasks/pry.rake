desc "Starts a repl console and requires the gem"
task :console do
  require 'pry'
  # find the current folder and the matching gemspec
  require "#{$calling_gem_name}"
  ARGV.clear
  ReplRake.load_config
  Pry.start
end
