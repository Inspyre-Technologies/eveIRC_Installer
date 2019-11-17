# frozen_string_literal: true

require 'thor'

module EveIRCInstaller
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    # Create and map the verbose option
    class_option :verbose, aliases: '-V', type: :boolean, default: false, desc: 'Run in verbose output mode.'
    map %w(--verbose -V) => :verbose

    desc 'version', 'eveIRC_Installer version'

    def version
      require_relative 'version'
      puts "v#{EveIRCInstaller::VERSION}"
    end

    map %w(--version -v) => :version

    desc 'config [FILE] [OVERWRITE]', 'Command description...'
    method_option :help, aliases: '-h', type: :boolean,
                  desc:           'Display usage information'
    method_option :overwrite, aliases: '-o', type: :boolean,
                  desc:                'Overwrite existing config file without asking'

    def config(file = nil, overwrite = false)
      if options[:help]
        invoke :help, ['config']
      else
        require_relative 'commands/config'
        EveIRCInstaller::Commands::Config.new(file, overwrite, options).execute
      end
    end
  end
end
