require './lib/navigator.rb'

class MarsRover
  def initialize(position, heading)
    @navigator = Navigator.new(position, heading)
  end

  def current_position
    @navigator.current_position
  end

  def turn_left
    @navigator.turn_left
    self
  end

  def turn_right
    @navigator.turn_right
    self
  end

  def move_forward
    @navigator.move_forward
    self
  end

  def parse_command(command_str)
    method_commands =
      {
        'L' => :turn_left,
        'R' => :turn_right,
        'M' => :move_forward
      }

    command_str.chars.each do |command|
      if method_commands.keys.include? command
        public_send method_commands[command]
      else
        fail InvalidCommandError, "The '#{ command }' char is not recognized as a valid command."
      end
    end
  end

  class InvalidCommandError < StandardError
  end
end
