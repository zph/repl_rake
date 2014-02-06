require "repl_rake/version"
require 'rake'

begin
  spec = Gem::Specification.find_by_name 'pry'
  REPL = 'pry'
  load "lib/repl_rake/tasks/pry.rake"
rescue Gem::LoadError => e
  REPL = 'irb'
  load "lib/repl_rake/tasks/irb.rake"
end

require'pry';binding.pry
module ReplRake
end
