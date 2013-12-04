IRB.conf.update(
#  :SAVE_HISTORY => 10000,
  :PROMPT_MODE => :SIMPLE
)

def rails_console?
  ENV.include?('RAILS_ENV') or (defined?(Rails) and Rails.env)
  #ENV.include?('RAILS_ENV') or (Rails && Rails.env)
end

begin
  require 'rubygems'
  require 'irb/completion'
  require 'pp'
  unless rails_console?
    #require 'what_methods'
    require 'wirble'
    Wirble.init
    Wirble.colorize
    require 'hirb' # after wirble
    require 'hirb-unicode'
    Hirb.enable
  end

  # --- added methods
  class Object
    def local_methods
      (methods - Object.instance_methods).sort
    end
  end

  # for rails script/console
  #ActiveRecord::Base.logger = Logger.new(stream)
  if rails_console? && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  end

rescue Exception => e
  puts e.message
  puts e.backtrace
end
