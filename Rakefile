require 'fileutils'

desc 'Create a codeeval skelton'
task :codeeval, 'challenge'
task :codeeval do |task, args|
  challenge = args.challenge
  if args.challenge.match(/\d+_(.+)/)
    script_name = $1
  else
    script_name = args.challenge
  end

  Dir.chdir Rake.original_dir
  FileUtils.mkdir_p challenge
  Dir.chdir challenge
  FileUtils.touch 'input.txt'
  template = <<-EOS
#!/usr/bin/env ruby -w

ARGF.each_line do |line|
  puts line.chomp
end
  EOS
  open("#{script_name}.rb", 'w') { |f| f.puts template }
  puts "created #{challenge}."
  puts "cd #{challenge}"
end

