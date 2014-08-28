require 'tempfile'
require 'shellwords'
desc "Starts a repl console and requires the gem"
task :console do
  require 'pry'
  # find the current folder and the matching gemspec
  require "#{$calling_gem_name}"
  ARGV.clear
  file = ReplRake.load_config
  if file
    content = File.read(file)
    if content[/binding\.pry/]
      exec("ruby #{file}")
    else # append binding.pry as tmpfile
      binding_pry = "require'pry';binding.pry"
      f = Tempfile.new('.pryrc')
        content_with_pry = [content, binding_pry].join("\n")
        File.write(f, content_with_pry)
        cmd = %Q{ruby #{f.path}}
        exec(cmd)
      f.close
      # end
    end
  else
    Pry.start
  end

end
