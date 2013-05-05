class Game
  class Hand
    def empty?
      true
    end
  end

  class Jar
    def size
      30
    end
  end

  attr_reader :hand, :jar

  def initialize
    @hand = Hand.new
    @jar = Jar.new
  end

end
