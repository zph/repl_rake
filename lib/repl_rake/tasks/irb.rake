task :console do
  require 'irb'
  require 'irb/completion'
  # TODO: maybe dynamically set it in Rakefile and then retrieve from ENV?
  require 'my_gem' # You know what to do.
  ARGV.clear
  IRB.start
end
