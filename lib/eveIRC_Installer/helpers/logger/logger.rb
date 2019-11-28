require_relative 'styler'
require 'tty-logger'

class Logger
  include Styler
  
  def initialize(class_name)
    p class_name
  
  end


end

class ThisThing
  
  def initialize
    log = Logger.new(self)
    p log.inspect
  end
end

ThisThing.new