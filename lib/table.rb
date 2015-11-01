class Table
  def place_robot(robot)
    @grid = Grid.new(robot) if grid.nil? || within_bounds?(robot)
    nil
  end

  def place_moved_robot
    place_robot(robot.moved_robot) if grid
  end

  def place_turned_robot(turn)
    place_robot(robot.send(:"#{turn}_robot")) if grid && [:left, :right].include?(turn)
  end

  def report_robots_position
    robot.to_s if grid
  end

  private

  attr_reader :grid

  def within_bounds?(object)
    object.x >= 0 && object.y >= 0 &&
      object.x < grid.width && object.y < grid.height
  end

  def robot
    grid.robot
  end
end
