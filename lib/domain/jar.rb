class Jar
  def initialize(beans=[])
    @beans = beans
    @open = true
  end

  def add_beans(bean_array)
    @beans = @beans + bean_array
  end

  def empty?
    @beans.empty?
  end

  def size
    @beans.size
  end

  def take_bean
    @beans.delete_at(Random.rand(size)) if !empty?
  end

  def put_bean(bean)
    if open?
      @beans << bean
      return bean
    else
      return nil
    end
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


