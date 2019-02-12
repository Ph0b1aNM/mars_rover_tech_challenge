module DirectionHelper
  module_function

  def change_orientation(orientation, turn)
    direction.rotate(turn_value(orientation, turn)).first
  end

  def move(orientation, x_pos, y_pos)
    x, y = move_values(orientation)
    [x_pos += x, y_pos += y]
  end

  def move_values(orientation)
    move_data[orientation]
  end

  def turn_value(orientation, turn)
    direction.index(orientation) + turn_data[turn]
  end

  def move_data
    {
      'N' => [0, 1],
      'E' => [1, 0],
      'S' => [0, -1],
      'W' => [-1, 0]
    }
  end

  def direction
    %w[N E S W]
  end

  def turn_data
    {
      'L' => -1,
      'R' => 1
    }
  end
end