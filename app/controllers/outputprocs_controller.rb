require_relative '../../lib/mars_rover'

class OutputprocsController < ApplicationController

	attr_accessor :varsopx, :varsopy, :varr1px, :varr1py, :varr1pface, :varinst1, :varr2px, :varr2py, :varr2pface, :varinst2

	def initialize(varsopx = Roverinput.first, varsopy = Roverinput.first, varr1px = Roverinput.first, varr1py = Roverinput.first, varr1pface = Roverinput.first, varinst1 = Roverinput.first, varr2px = Roverinput.first, varr2py = Roverinput.first, varr2pface = Roverinput.first, varinst2 = Roverinput.first)
		@varsopx = varsopx[:sopx]
		@varsopy = varsopy[:sopy]
		@varr1px = varr1px[:r1px]
		@varr1py = varr1py[:r1py]
		@varr1pface = varr1pface[:r1pface]
		@varinst1 = varinst1[:inst1]
		@varr2px = varr2px[:r2px]
		@varr2py = varr2py[:r2py]
		@varr2pface = varr2pface[:r2pface]
		@varinst2 = varinst2[:inst2]
	end

	def index
		@testvar = Roverinput.first
	end

	def show(top_right_x = @varsopx, top_right_y = @varsopy)
    @top_right_x = top_right_x
    @top_right_y = top_right_y
    @varinst1
  	end

  	#Processing Output

  	def run_output
    output_data.each do |params|
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

  def output_data
    {
      'rover_one' => {
        'start_position' => [@varr1px, @varr1py, @varr1pface],
        'nasa_command' => [@varinst1],
        'expected_position' => [1, 3, 'N']
      },
      'rover_two' => {
        'start_position' => [@varr2px, @varr2py, @varr2pface],
        'nasa_command' => [@varinst2],
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
