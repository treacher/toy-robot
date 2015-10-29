class Direction
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def left_direction
    direction_for(left)
  end

  def right_direction
    direction_for(right)
  end

  def eql?(object)
    self.value == object.value
  end

  def to_s
    "value = #{value}"
  end

  private

  def left
    -1
  end

  def right
    1
  end

  def direction_for(turn)
    Direction.new(compass_for_direction.rotate(turn).first).freeze
  end

  def compass_for_direction
    compass.rotate(compass.index(value))
  end

  def compass
    [:west, :north, :east, :south].freeze
  end
end