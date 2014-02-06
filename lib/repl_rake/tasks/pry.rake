task :console do
  require 'pry'
  # find the current folder and the matching gemspec
  require 'my_gem'
  ARGV.clear
  Pry.start
end
