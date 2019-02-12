require_relative 'lib/mars_rover'

# Demo
module MarsRoverRunner
  module_function

  def run_demo
    welcome_msg
    demo_data.each do |params|
      rover_id_and_position(params)
      sp = params[1]['start_position']
      rover = RoverNavigation.new(sp[0], sp[1], sp[2])
      puts "Processing:\t\t\t#{params[1]['nasa_command']}"
      rover.nasa_command(params[1]['nasa_command'])
      nasa_command_outcome(params, rover)
    end
  end

  def rover_id_and_position(params)
    puts "Mars Rover ID:\t\t\t#{param_to_name(params.first)}"
    puts "Current Position:\t\t#{params[1]['start_position'].join(' ')}"
  end

  def welcome_msg
    line
    puts "\tWelcome to the Mars Rover Explorer!"
    line
    puts
  end

  def line(len = 80)
    puts '#' * len
  end

  def demo_data
    {
      'rover_one' => {
        'start_position' => [1, 2, 'N'],
        'nasa_command' => 'LMLMLMLMM',
        'expected_position' => [1, 3, 'N']
      },
      'rover_two' => {
        'start_position' => [3, 3, 'E'],
        'nasa_command' => 'MMRMMRMRRM',
        'expected_position' => [5, 1, 'E']
      }
    }
  end

  def param_to_name(param_name)
    param_name.split('_').map(&:capitalize).join(' ')
  end

  def nasa_command_outcome(params, rover_one)
    puts "Expected Position:\t\t#{params[1]['expected_position'].join(' ')}"
    puts "Final Position:\t\t\t#{rover_one.current_position}"
    line
  end
end

MarsRoverRunner.run_demo if $PROGRAM_NAME == __FILE__