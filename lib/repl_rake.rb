require "repl_rake/version"
require 'rake'

module ReplRake

  def self.load_config
    file = ".repl_rake.rb"
    return unless File.exists?(file)
    load file
  end

  def self.setup
    gem_spec = Gem::Specification.new(Dir["*.gemspec"].first)
    $calling_gem_name = gem_spec.name.split('.').first
    spec = Gem::Specification.find_by_name 'repl_rake'
    call_best_repl(spec.gem_dir)
  end

  def self.call_best_repl(spec_gem_dir)
    begin
      spec = Gem::Specification.find_by_name 'pry'
      load "#{spec_gem_dir}/lib/repl_rake/tasks/pry.rake"
    rescue Gem::LoadError => e
      load "#{spec_gem_dir}/lib/repl_rake/tasks/irb.rake"
    end
  end
end
