require "eveIRC_Installer/version"
require 'eveIRC_Installer/helpers/helpers'

module EveIRCInstaller

  # Register an alias for an EveIRCInstaller::Helpers::LogMan
  # instance that can be referenced later.
  LogMain = EveIRCInstaller::Helpers::LogMan.new

  # Load a constant for all-program access of the
  # logger object
  Logger = LogMain.logger

  # Load a constant to abstract/alias the
  # PrettifyCaller library calls for the
  # whole program
  PrettyName = LogMain.pretty_caller

  # Register a new class for local errors
  class Error < StandardError; end

  # Register a new class for network-related errors
  class NetworkError < Error

    # Register a child of the NetworkError class to
    # be raised when DNS connectivity fails but is
    # needed in order to continue operation
    #
    # @!attribute msg
    #   @return [String] A message to the end-user
    #     advising them of a possible error cause
    #
    # @!attribute hint
    #   @return [String] A string containing a message
    #     advising the end-user of possible next steps.
    class DNSError < NetworkError
      attr_reader :msg, :hint

      @msg = 'Unable to connect to google.com while checking network connectivity'

      @hint = 'DNS must be working in order for this program to function,'\
              ' please contact a network administrator.'

    end

    # Register an exception classs to be raised after the
    # program runs both pings (DNS and IP) and receives a
    # fail on both. If this exception is raised eveIRC
    # installer was unable to find any path to google.com
    # which usually means that your connection is failing.
    #
    # @!attribute msg
    #   @return [String] A message to the end-user
    #     advising them of a possible error cause
    #
    # @!attribute hint
    #   @return [String] A string containing a message
    #     advising the end-user of possible next steps.
    class NoConnectionError < DNSError
      attr_reader :msg, :hint

      @msg = 'Failed to ping 8.8.8.8 after failing to ping google.com. Network failure.'

      @hint = 'Check your network cables/drives/adapters or contact a system or network '\
              'administrator and try again.'
    end
            
  end

end

# EveIRCInstaller
# Taylor-Jayde Blackstone
