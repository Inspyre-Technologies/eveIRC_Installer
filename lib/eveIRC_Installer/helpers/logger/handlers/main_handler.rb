module EveIRCInstaller

  module Helpers
    class Logger

      module Handlers
        class MainHandler


          def initialize(output: nil, config: nil, label: nil)
            @label  = label
            @output = output
          end

          def call(event)
            @output.puts "(#{@label}) #{event.message.join}"
          end
        end
      end
    end

  end
end
