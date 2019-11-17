# frozen_string_literal: true

require 'thor'
# @author Taylor-Jayde Blackstone <t.blackstone@inspyre.tech>
# @since 1.0
#
# Library for the eveIRC Installer application
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
    # Create and map the log option
    class_option :log, aliases: '-L', type: :boolean, default: true, desc: 'Run with logging enabled.'
    # Create and map the quiet option
    class_option :quiet, aliases: '-q', type: :boolean, default: false, desc: 'Tell program not to output any'\
                                                                                    ' output unless an error occurrs'\
                                                                                    ' or user-input is required.'
    map %w(--verbose -V) => :verbose

    desc 'version', 'eveIRC_Installer version'

    # @author Taylor-Jayde Blackstone <t.blackstone@inspyre.tech>
    # @since 1.0
    #
    # @return [String] The version of the installer app.
    def version
      require_relative 'version'
      puts "v#{EveIRCInstaller::VERSION}"
    end

    map %w(--version -v) => :version

    desc 'config [FILE] ', 'Starts the workflow that will create your bot\'s config file'
    method_option :help, aliases: '-h', type: :boolean,
                  desc:           'Display usage information'

    method_option :overwrite, aliases: '-o', type: :boolean,
                  desc:                'Overwrite existing config file without asking.'


    method_option :overwrite, aliases: '-O', type: :boolean,
                  desc:                'Test matching file in the config directory.'

    method_option :config_plugins, aliases: '-P', type: :boolean,
                  desc:                     'Install eveIRC Bot & plugins. If this is set to false PlugMan will not come up'\
                                     ' during installation.'

    # @param file [String] Path where eveIRC Installer can find a
    #   config file that it can use to configure a new instance of
    #   eveIRC Bot
    #
    # @param overwrite [Boolean] The config command should overwrite
    #   any matching file present in it's config/ directory without
    #   confirming. True | False
    #
    # @param test-file [Boolean] Should only be used in conjunction
    #   with the --file=FILEPATH argument otherwise it will fallback
    #   to testing any matching file in it's config/ dir
    #
    # @param config-plugins [Boolean] If invoked and not passed the true
    # option, it will default to saying 'false' which is the same as saying;
    # 'I do not want you to set up any plugins for the eveIRC Installer.'
    #
    # @return [Hash] This should finally return a hash that is formatted
    #   and ready to be delivered to TTY::Config to load it into our overhead
    #   and (later) serialize it.

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
