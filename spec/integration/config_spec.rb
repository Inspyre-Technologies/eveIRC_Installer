RSpec.describe "`eve_i_r_c_installer config` command", type: :cli do
  it "executes `eve_i_r_c_installer help config` command successfully" do
    output          = `eve_i_r_c_installer help config`
    expected_output = <<-OUT
Usage:
  eve_i_r_c_installer config [FILE] [OVERWRITE]

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
