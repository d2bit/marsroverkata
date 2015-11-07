require './lib/mars_rover.rb'
require './lib/point.rb'
require './lib/map.rb'

class MarsRoverRunner
  def initialize(input)
    @map = nil
    @deploys = []
    parse(input)
  end

  def run
    output = ''
    @deploys.each do |deploy|
      mars_rover, command_str = deploy.values
      mars_rover.parse_command(command_str)
      output << "#{mars_rover}\n"
    end
    output
  end

  private

  def parse(input)
    input = input.split("\n")
    grid_bounds = Point.new(*input.shift.split(' ').map(&:to_i))
    @map = Map.new(grid_bounds)

    until input.empty?
      line = input.shift.split(' ')
      position = Point.new(line[0].to_i, line[1].to_i)
      heading = Navigator::DIRECTIONS[line[2]]
      mars_rover = MarsRover.new(@map, position, heading)
      commands = input.shift.strip
      @deploys << { rover: mars_rover, commands: commands }
    end
  end
end
