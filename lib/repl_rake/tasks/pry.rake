task :console do
  require 'pry'
  # find the current folder and the matching gemspec
  require "#{$calling_gem_name}"
  ARGV.clear
  Pry.start
end
