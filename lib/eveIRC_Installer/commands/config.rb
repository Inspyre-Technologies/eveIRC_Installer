# frozen_string_literal: true

require_relative '../command'

module EveIRCInstaller
  module Commands
    # @author Taylor-Jayde Blackstone <t.blackstone@inspyre.tech>
    # @since 1.0
    #
    # Class for the config command for the program
    #
    # @!attribute logger
    #   @return [Object] This contains a logger object
    # @!attribute options
    #   @return [Hash] A hash of the current state of
    #     options within the program
    class Config < EveIRCInstaller::Command
      attr_accessor :options

      # Initialize the class and it's attributes
      def initialize(file, overwrite, options)

        @file        = file
        @overwrite   = overwrite
        @options     = options
        @network     = EveIRCInstaller::Helpers::Environment::Network.new
        @pretty_name = EveIRCInstaller::PrettyName.do_format(self)

      end

      # Execute the config command for EveIRCInstaller. This will set off a
      # chain of checks and environment preparers with the goal of making
      # this process more seamless for the user.
      def execute(input: $stdin, output: $stdout)
        Logger.info('Received call to start configuration for eveIRC Bot installer!', who_rang: @pretty_name)
        Logger.wait('Checking network...', who_rang: @pretty_name)
        @network.do_check
        Logger.wait('Starting command class...', who_rang: @pretty_name)
        cmd = command(printer: :null)
        Logger.success 'Started Command class.'

        # do_test = cmd.run!('ping -c 25 google.com') do |out, err|
        #   Logger.debug(out) if out
        #   Logger.error(err) if err
        # end
        #
        # if do_test.failure?
        #   Logger.warn 'Ping test failed!'
        # else
        #   Logger.success 'Ping test successful!'
        # end

      end

      # def run_test
      #   require 'tty-spinner'
      #   spinner = TTY::Spinner.new "[:spinner] Checking connectivity... ", format: :arrow_pulse
      #   spinner.auto_spin
      #   do_test = cmd.run!('ping -c 25 google.com') do |out, err|
      #     Logger.debug(out) if out
      #     Logger.error(err) if err
      #   end
      #   if do_test.failure?
      #     raise NetworkError::DNSError
      #   end
      #   spinner.stop('Finished DNS checking!')
      # end

    end
  end
end
