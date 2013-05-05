class Game
  class Hand
    def initialize
      @has_bean = false
    end

    def empty?
      !@has_bean
    end

    def take_bean
      @has_bean = true
    end

    def put_bean
      @has_bean = false
    end
  end

  class Jar
    def initialize
      @beans = 30
    end

    def size
      @beans
    end

    def take_bean
      @beans -= 1
    end

    def put_bean
      @beans += 1
    end
  end

  attr_reader :hand, :jar

  def initialize
    @hand = Hand.new
    @jar = Jar.new
  end

  def take_bean
    if hand.empty?
      jar.take_bean
      hand.take_bean
    end
  end

  def put_bean
    if !hand.empty?
      hand.put_bean
      jar.put_bean
    end
  end

end
