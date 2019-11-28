module EveIRCInstaller
  module Helpers
    class LogMan
      
      # @author Taylor-Jayde Blackstone <t.blackstone@inspyre.tech
      # @since 1.0
      #
      # Register a class that will handle Logging
      # by default unless user intervention (i.e.
      # via command switches) has LogMan load a
      # different handler
      class DefaultHandler
        
        # @return [Object] A new instance of the DefaultHandler class
        def initialize(output: nil, config: nil, formatter: nil, pretty_name: nil)
          @pretty_name = pretty_name
          @output      = output
        end
        
        # Call method to receive our handler calls
        def call(event)
          @output.puts "(#{@pretty_name}) #{event.message.join}"
        end
      end
    end
  end
end
