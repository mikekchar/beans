class Hand
  attr_reader :bean

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

  def put_bean_into(jar)
    if !empty? && jar.open?
      jar.put_bean(@bean)
      @bean = nil
    end
  end
end


