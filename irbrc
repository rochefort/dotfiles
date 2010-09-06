IRB.conf.update(
  :SAVE_HISTORY => 10000,
  :PROMPT_MODE => :SIMPLE
)

begin
  require 'rubygems'
  require 'irb/completion'
  require 'pp'
  require 'wirble'
  require 'hirb'       # after wirble
  Wirble.init
  Wirble.colorize
  Hirb.enable
  
  # --- added methods
  class Object
    def local_methods
      (methods - Object.instance_methods).sort
    end
  end
  
  # for rails script/console
  if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
      require 'logger'
        RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
  end

rescue Exception => e
  p e.message
  p e.backtrace
end
