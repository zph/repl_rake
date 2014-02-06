task :console do
  require 'irb'
  require 'irb/completion'
  # TODO:
  require 'my_gem' # You know what to do.
  ARGV.clear
  IRB.start
end
