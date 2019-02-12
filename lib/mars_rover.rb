require_relative 'direction_helper'

class RoverNavigation
  include DirectionHelper

  def initialize(x_pos, y_pos, orientation)
    @x_pos = x_pos
    @y_pos = y_pos
    @orientation = orientation
  end

  def nasa_command(string)
    string.split('').each do |cmd|
      @cmd = cmd
      case cmd
      when 'L'
        orientate
      when 'R'
        orientate
      when 'M'
        mover
      end
    end
    [@x_pos, @y_pos, @orientation]
  end

  def current_position
    "#{@x_pos} #{@y_pos} #{@orientation}"
  end

  private

  def mover
    @x_pos, @y_pos = move(@orientation, @x_pos, @y_pos)
  end

  def orientate
    @orientation = change_orientation(@orientation, @cmd)
  end
end
