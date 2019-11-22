module EveIRCInstaller
  module Helpers
    class LogMan
      module PrettifyCaller

        def self.do_format(target = self)
          f_caller = if target == self
                       to_s
                     else
                       target.to_s.split(':0x')
                     end
          if f_caller[0].include?('#<')
            f_caller[0].gsub!('#<', '')
            f_caller[0].gsub!('::', ' ⇉ ')
          end
          p f_caller[0]
        end


      end
    end
  end
end
