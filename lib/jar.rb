class Jar
  def initialize(beans=[])
    @beans = beans
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
    @beans << bean
  end

  def beans_that_are(colour)
    @beans.select { |bean| bean.colour == colour }
  end
end


