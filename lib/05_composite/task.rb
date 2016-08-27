class CompositeTask
  def initialize(name)
    @name = name
    @children = []
  end

  def add_child_task(task)
    @children << task
  end

  def estimate
    @children.map(&:estimate).reduce(:+)
  end
end

class Task
  def initialize(name)
    @name = name
  end

  def estimate
    raise NotImplementedError
  end
end

class BoilWater < Task
  def initialize
    super("Boil Water")
  end

  def estimate
    10
  end
end

class OpenRamenPacket < Task
  def initialize
    super("OpenRamenPacket")
  end

  def estimate
    0.25
  end
end

class AddNoodles < Task
  def initialize
    super("Add Noodles")
  end

  def estimate
    5
  end
end

class AddSeasoning < Task
  def initialize
    super("Add Seasoning")
  end

  def estimate
    1
  end
end

class MakeRamen < CompositeTask
  def initialize
    super("Make Ramen")
    add_child_task(BoilWater.new)
    add_child_task(OpenRamenPacket.new)
    add_child_task(AddNoodles.new)
    add_child_task(AddSeasoning.new)
  end
end
