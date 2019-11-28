module EveIRCInstaller
  module Helpers
    class LogMan
      module StyleConf
        require 'pastel'
        
        
        @pastel = Pastel.new
        
        
        def self.styles
          @styles = {
            styles: {
              debug: {
                symbol:   '🐛🐛🐛░',
                label:    '|DEBUG|',
                levelpad: 3
              },
              info:  {
                symbol:   'Ⓘ',
                label:    @pastel.blue('|INFO|'),
                levelpad: 0
              },
              warn:  {
                symbol:   '⚠',
                label:    '|WARN|',
                levelpad: 0
              },
              error: {
                symbol:   '⚠',
                label:    '|ERR|',
                levelpad: 0
              }
              
            }
          }
        
        end
      end
    end
  end
end