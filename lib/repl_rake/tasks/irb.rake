task :console do
  require 'irb'
  require 'irb/completion'
  # TODO: maybe dynamically set it in Rakefile and then retrieve from ENV?
  require "#{$calling_gem_name}"
  ARGV.clear
  IRB.start
end
