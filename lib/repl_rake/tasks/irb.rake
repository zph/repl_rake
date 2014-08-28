desc "Starts a repl console and requires the gem"
task :console do
  require 'irb'
  require 'irb/completion'
  # TODO: maybe dynamically set it in Rakefile and then retrieve from ENV?
  require "#{$calling_gem_name}"
  ARGV.clear
  ReplRake.load_config
  IRB.start
end
