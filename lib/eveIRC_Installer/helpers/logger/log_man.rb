module EveIRCInstaller
  module Helpers
    # @author Taylor-Jayde  Blackstone <t.blackstone@inspyre.tech>
    # @since 1.0
    #
    # A class to hold the program's logger object. Will be used to pass
    # info to the user at varying degrees of importance.
    class LogMan
      attr_accessor :logger, :pretty_caller
      require 'tty-file'
      require 'tty-logger'
      require 'eveIRC_Installer/helpers/logger/prettify_caller'



      def initialize
        @pretty_caller = PrettifyCaller
        @time        = Time.now
        h_date       = @time.strftime('%m/%d/%Y')
        h_time       = @time.strftime('%H:%M:%S')
        h_text       = 'Logging started on ' + h_date + ' at ' + h_time
        @header      = '##-- ' + h_text + ' --##' + "\n"
        @f_timestamp = @time.strftime('%Y-%m-%d_%H-%M-%S')
        @file        = 'logs/' + @f_timestamp + '.log'

        create_file
        @styles = {
          styles: {
            success: {
              symbol:       '•ᴗ•',
              label:        'Success!',
              labelpadding: 3
            },
            fatal:   {
              symbol: ':(',
              label:  'Fatal Error!'
            }
          }
        }
        TTY::Logger.configure do |config|
          config.metadata = [:all]
          config.handlers = [
            [:stream, output: File.open(@file, 'a')],
            [:console, @styles, output: File.open(@file, 'a')]
          ]
        end
        @logger = TTY::Logger.new(fields: { app: 'eveIRC_Installer' })
      end

      def create_file
        h_date = @time.strftime('%m/%d/%Y')
        h_time = @time.strftime('%H:%M:%S')
        h_text = 'Logging started on ' + h_date + ' at ' + h_time
        header = '##-- ' + h_text + ' --##'

        file = TTY::File
        file.create_file(@file, header)
      end
    end
  end
end
