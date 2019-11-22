module EveIRCInstaller
  module Helpers
    class Environment
      class Network


        def initialize(checker: nil, color: true)

          @pretty_name = EveIRCInstaller::Helpers::LogMan::PrettifyCaller
          @pretty_name = @pretty_name.do_format(self)

          options = {
            checker: checker,
            color:   color,
            caller:  self
          }
          name = self.to_s
          p name
        end

        def check

          EveIRCInstaller::Logger.info 'Received call'


        end

      end
    end
  end
end
