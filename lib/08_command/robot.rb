class Robot
  def initialize
    @commands = []
  end

  def dance
    @commands.each { |x| x.execute }
  end

  def add_move(move, count)
    @commands << Move.new(move, count)
  end
end

class Command
  def execute
    raise NotImplementedError
  end
end

class Move < Command
  def initialize(move, count)
    @action = move
    @count = count
  end

  def execute
    @count.times do puts @action end
  end
end

def make_robot_move
  robot = Robot.new
  robot.add_move("shake", 2)
  robot.add_move("Left", 2)
  robot.add_move("Right", 5)
  robot.dance()
end
