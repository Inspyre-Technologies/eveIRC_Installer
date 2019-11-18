module EveIRCInstaller
  module Helpers
    class WriteHandler

      def initialize(output: nil, config: nil, label: nil)
        @label = label
        @output = output
        @buffer ||= [] unless @buffer
      end

      def call(event)

      end

    end
  end
end