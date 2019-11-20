# frozen_string_literal: true

require_relative '../command'

module EveIRCInstaller
  LOG_MAN = Helpers::LogMan.new
  module Commands
    class Config < EveIRCInstaller::Command
      attr_accessor :logger

      def initialize(file, overwrite, options)
        @file      = file
        @overwrite = overwrite
        @options   = options
        @logger    = LOG_MAN.logger
        @network   = EveIRCInstaller::Helpers::Environment::Network.new

      end

      def execute(input: $stdin, output: $stdout)
        @logger.info 'Received call to start configuration for eveIRC Bot installer!'
        @logger.wait 'Checking network...'
        @network.check
        @logger.wait 'Starting command class...'
        cmd = command(printer: :null)
        @logger.success 'Started Command class.'

        do_test = cmd.run!('ping -c 25 google.com') do |out, err|
          @logger.debug(out) if out
          @logger.error(err) if err
        end

        if do_test.failure?
          @logger.warn 'Ping test failed!'
        else
          @logger.success 'Ping test successful!'
        end

      end

      def run_test
        require 'tty-spinner'
        spinner = TTY::Spinner.new "[:spinner] Checking connectivity... ", format: :arrow_pulse
        spinner.auto_spin
        do_test = cmd.run!('ping -c 25 google.com') do |out, err|
          @logger.debug(out) if out
          @logger.error(err) if err
        end
        if do_test.failure?
          raise NetworkError::DNSError
        end
        spinner.stop('Finished DNS checking!')
      end

    end
  end
end
