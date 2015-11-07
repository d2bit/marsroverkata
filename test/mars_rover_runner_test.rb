require 'minitest/autorun'
require './lib/mars_rover_runner.rb'

describe MarsRoverRunner do
  it 'parses and the input and gets the solution' do
    input = <<EOF
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
EOF
    output = <<EOF
1 3 N
5 1 E
EOF
    cli = MarsRoverRunner.new(input)
    cli.run.must_equal(output)
  end
end
