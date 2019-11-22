module EveIRCInstaller
  module Helpers
    class Environment

      # @author Taylor-Jayde Blackstone
      # @since 1.0
      #
      # Class for information about the network environment
      class Network


        def initialize(checker: nil, color: true)
          Logger.debug "Received call from #{caller.class}"

          @pretty_name = EveIRCInstaller::PrettyName.do_format(self)

          options = {
            checker: checker,
            color:   color,
            caller:  self
          }
          Logger.success 'Network environment class initialized'
        end

        def do_check
          Logger.wait 'Initiating DNS dependant connection check...'
          unless check_DNS
            Logger.warn 'DNS dependant check failed!'
            unless check_IP
              Logger.error 'Failed both ping tests. Likely to have no connection. Raising fatal exception!'
              raise EveIRCInstaller::NetworkError::NoConnectionError
            end
            Logger.success 'Pinging 8.8.8.8 succeeded'
          end
          Logger.success 'Pinging google.com succeeded, DNS seems functional'
        end

        
        # @return [Boolean] DNS connectivity to google.com established?
        def check_DNS

          EveIRCInstaller::Logger.info 'Received call'


        end

        # @note This should only run if DNS connectivity failed to establish
        # @return [Boolean] IP Connectivity available?
        def check_IP

        end

      end
    end
  end
end
