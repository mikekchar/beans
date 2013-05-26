class Hand
  attr_accessor :bean

  def initialize
    @bean = nil
  end

  def empty?
    @bean.nil?
  end

  def take_bean_from(jar)
    if empty?
      @bean = jar.take_bean
      return @bean
    else
      return nil
    end
  end

  def put_bean_into(jar)
    if !empty? && jar.open?
      ret = jar.put_bean(@bean)
      @bean = nil if ret
      return ret
    else
      return nil
    end
  end
end


