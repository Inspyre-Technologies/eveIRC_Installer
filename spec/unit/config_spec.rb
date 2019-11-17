require 'eveIRC_Installer/commands/config'

RSpec.describe EveIRCInstaller::Commands::Config do
  it "executes `config` command successfully" do
    output    = StringIO.new
    file      = nil
    overwrite = nil
    options   = {}
    command   = EveIRCInstaller::Commands::Config.new(file, overwrite, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
