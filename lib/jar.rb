class Jar
  def initialize(beans=[])
    @beans = beans
    @open = true
  end

  def empty?
    @beans.empty?
  end

  def size
    @beans.size
  end

  def take_bean
    @beans.delete_at(Random.rand(size))
  end

  def put_bean(bean)
    @beans << bean if open?
  end

  def open
    @open = true
  end

  def close
    @open = false
  end

  def open?
    @open
  end

  def beans_that_are(colour)
    @beans.select { |bean| bean.colour == colour }
  end
end


