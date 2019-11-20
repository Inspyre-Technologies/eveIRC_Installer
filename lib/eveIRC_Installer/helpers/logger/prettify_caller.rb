module EveIRCInstaller
  module Helpers
    class LogMan
      class PrettifyCaller
        attr_accessor :format

        def initialize
          p 'It is ' + caller[0]

          @format = do_format

        end

        def do_format
          f_caller = if caller == self
                       to_s
                     else
                       caller.to_s.split(':0x')
                     end
          if f_caller[0].include?('#<')
            f_caller[0].gsub!('#<', '')
            f_caller[0].gsub!('::', ' ⇉ ')
          end
          f_caller
        end


      end
    end
  end
end