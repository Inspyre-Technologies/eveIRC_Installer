require "eveIRC_Installer/version"
require 'eveIRC_Installer/helpers/helpers'

module EveIRCInstaller

  class Error < StandardError; end

  class NetworkError < Error

    class DNSError
      attr_reader :msg, :hint

      @msg = 'Unable to connect to google.com while checking network connectivity'

      @hint = 'DNS must be working in order for this program to function,'\
              ' please contact a network administrator.'

    end

  end

end
