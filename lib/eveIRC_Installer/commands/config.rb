# frozen_string_literal: true

require_relative '../command'

module EveIRCInstaller
  module Commands
    class Config < EveIRCInstaller::Command
      def initialize(file, overwrite, options)
        @file      = file
        @overwrite = overwrite
        @options   = options
        @logger = logger.new do |conf|
          conf.handlers = [
            [EveIRCInstaller::Helpers::Logger::Handlers::MainHandler, label: 'default_handler'],
            [:stream, output: File.open('errors.log', 'a'), level: :info],
            [:console, output: $stderr, level: :error]
          ]
        end

      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        p @logger.inspect
        output.puts "OK"
        cmd = command
        @cmd_buff ||= [] unless @cmd_buff
        @err_buff ||= [] unless @err_buff
        @logger.success 'Started Command class.'
        # cmd.run 'ping -c 10 google.com' do |out, err|
        #   @cmd_buff << out if out
        #   @err_buff << err if err
        # end

        out, err = cmd.run('ping -c 25 google.com', :out => 'output.log')

        puts "OUT>> #{out}"
        puts "ERR>> #{err}"

        # threads = []
        # 3.times do |i|
        #   th = Thread.new do
        #     10.times { cmd.run 'ping -c 1 google.com' }
        #   end
        #   threads << th
        # end
        # threads.each(&:join)

        file = File.open(Dir.pwd + '../logs/' + Time.now.to_f.to_s.gsub!('.', '-'), @cmd_buff.join)
        file.write @err_buff

        p @cmd_buff

        res = [@cmd_buff, @err_buff]
        res.each do |content|
          File.write(Dir.pwd + '../logs/' + Time.now.to_f.to_s.gsub!('.', '-'), content)
        end

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
