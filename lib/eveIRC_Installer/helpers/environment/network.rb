module EveIRCInstaller
  module Helpers
    class Environment
      class Network

        def initialize(checker: nil, color: true)

          options = {
            checker: checker,
            color:   color,
            caller:  caller
          }
          logger  = EveIRCInstaller::LOG_MAN.logger
          @logger = logger
        end

        def check

          @logger.info 'Received call from ' + "#{caller[0]}"


        end

      end
    end
  end
end