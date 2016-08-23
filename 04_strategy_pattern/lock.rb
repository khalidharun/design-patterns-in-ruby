class Lock
  def initialize(strategy)
    @strategy = strategy
  end

  def unlock(user, password)
    @strategy.authenticate(user, password)
  end
end

class UpcaseAuth
  def authenticate(user, password)
    user.upcase == password
  end
end

class DowncaseAuth
  def authenticate(user, password)
    user.downcase == password
  end
end
