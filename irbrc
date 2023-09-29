IRB.conf.update(
  PROMPT_MODE: :SIMPLE
)

# def rails_console?
#   ENV.include?('RAILS_ENV') or defined?(Rails.env)
# end

require 'katakata_irb' rescue nil

begin
  require 'irb/completion'
  # unless rails_console?
  #   require 'awesome_print'
  #   require 'what_methods'
  #   require 'wirble'
  #   Wirble.init
  #   Wirble.colorize
  #   require 'hirb' # after wirble
  #   require 'hirb-unicode'
  #   Hirb.enable
  # end

  # --- added methods
  class Object
    def local_methods
      (methods - Object.instance_methods).sort
    end
  end

rescue Exception => e
  puts e.message
  puts e.backtrace
end

IRB::Context.prepend(Module.new{
  def evaluate(line, *, **)
    case line
    when /\A\$ /
      line.replace("show_source #{line.sub(/\A\$ /, '').strip.dump}\n")
    end
    super
  end
})

