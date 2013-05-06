class Hand
  def initialize
    @bean = nil
  end

  def empty?
    @bean.nil?
  end

  def take_bean_from(jar)
    if empty?
      @bean = jar.take_bean
    end
  end

  def put_bean_in(jar)
    if !empty?
      jar.put_bean(@bean)
      @bean = nil
    end
  end
end


