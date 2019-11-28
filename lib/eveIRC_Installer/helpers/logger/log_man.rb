module EveIRCInstaller
  module Helpers
    # @author Taylor-Jayde  Blackstone <t.blackstone@inspyre.tech>
    # @since 1.0
    #
    # A class to hold the program's logger object. Will be used to pass
    # info to the user at varying degrees of importance.
    #
    # @!attribute pretty_caller
    #   @return [String] A string containing a more asthetic/readable copy
    #     of the caller's name
    #
    # @!attribute logger
    #  @return [Object] An object containing an initialized logger
    class LogMan
      attr_accessor :logger, :pretty_caller, :raw_logger
      require 'tty-file'
      require 'tty-logger'
      require 'eveIRC_Installer/helpers/logger/prettify_caller'
  
  
      def initialize
        @pretty_caller = PrettifyCaller
        @time          = Time.now
        h_date         = @time.strftime('%m/%d/%Y')
        h_time         = @time.strftime('%H:%M:%S')
        h_text         = 'Logging started on ' + h_date + ' at ' + h_time
        @header        = '##-- ' + h_text + ' --##' + "\n"
        @f_timestamp   = @time.strftime('%Y-%m-%d_%H-%M-%S')
        @file          = 'logs/' + @f_timestamp + '.log'

        create_file
        @styles = {
          styles: {
            success: {
              symbol:   '✓ ',
              label:    'Success!',
              levelpad: 3,
              color:    'green'
            },
            fatal:   {
              symbol: ':( ',
              label:  'Fatal Error!'
            },
            info:    {
              symbol:   'Ⓘ ',
              label:    'Info',
              levelpad: 7,
              color:    'blue'
            },
            wait:    {
              symbol:   '⏲ ',
              label:    'Waiting...',
              levelpad: 1,
              color:    'yellow'
            }
          }
        }
        TTY::Logger.configure do |config|
          config.metadata = [:date, :time, :pid]
          config.handlers = [
            [:stream, output: File.open(@file, 'a')],
            [:console, @styles, output: File.open(@file, 'a'), level: :debug]
          ]
        end
        p caller_locations.first.label
        @logger = TTY::Logger.new(fields: { who_rang: caller.first })
        @logger.info('Logger started', { who_rang: @pretty_caller.do_format(self) })
      end
  
      # @return [Object] A file IO stream for writing log output to
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
