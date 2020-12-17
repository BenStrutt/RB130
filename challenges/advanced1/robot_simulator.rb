class Robot
  BEARINGS = { north: [0,1], east: [1,0], south: [0,-1], west: [-1,0] }
  
  def bearing
    BEARINGS.keys[direction]
  end
  
  def orient(bearing)
    raise ArgumentError unless BEARINGS.keys.include?(bearing)
    self.direction = BEARINGS.keys.index(bearing)
  end
  
  def turn_left
    self.direction = (direction - 1 < 0) ? 3 : direction - 1
  end
  
  def turn_right
    self.direction = (direction + 1 > 3) ? 0 : direction + 1
  end
  
  def at(*coords)
    self.coords = coords
  end
  
  def coordinates
    coords
  end
  
  def advance
    coords.map!.with_index { |current, i| current + BEARINGS[bearing][i] }
  end
  
  attr_accessor :direction, :coords
end

class Simulator
  def instructions(s)
    s.chars.map { |c| [:turn_left, :turn_right, :advance][%w(L R A).index(c)] }
  end
  
  def place(robot, x:, y:, direction:)
    robot.at(x, y); robot.orient(direction)
  end
  
  def evaluate(robot, str)
    instructions(str).each { |instr| robot.send(instr) }
  end
end