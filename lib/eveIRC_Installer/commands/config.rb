# frozen_string_literal: true

require_relative '../command'

module EveIRCInstaller
  module Commands
    class Config < EveIRCInstaller::Command
      def initialize(file, overwrite, options)
        @file      = file
        @overwrite = overwrite
        @options   = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        output.puts "OK"
        p @options
        if @options[:verbose]
          p 'I am verbose'
        else
          p 'I am not verbose'
        end
      end
    end
  end
end
