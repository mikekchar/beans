require 'bean'

class Game

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

  class Jar
    def initialize
      @beans = Array.new(6){ Bean.new(:red) }
      @beans += Array.new(6){ Bean.new(:green) }
      @beans += Array.new(6){ Bean.new(:blue) }
      @beans += Array.new(6){ Bean.new(:yellow) }
      @beans += Array.new(6){ Bean.new(:black) }
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

  attr_reader :hand, :jar

  def initialize
    @hand = Hand.new
    @jar = Jar.new
  end

  def take_bean
    hand.take_bean_from(jar)
  end

  def put_bean
    hand.put_bean_in(jar)
  end

end
