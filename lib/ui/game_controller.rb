require "domain/game"

module UI
  class GameController
    def initialize(game)
      @game = game
    end

    def read_input
      STDIN.gets.chop
    end

    def handle_input
      input = read_input
      case input
      when ""
        @game.pass
        carry_on
      when "q", "Q"
        quit
      when *@game.jars.names
        if @game.hand.empty?
          @game.take_bean_from(@game.jars.get(input))
        else
          @game.put_bean_into(@game.jars.get(input))
        end
        carry_on
      when "snap"
        if @game.snapped?
          #@game.
          @game.winnings += @game.points
        end
        print "  \n"
        carry_on
      else
        carry_on
      end
    end

    def quit
      false
    end

    def carry_on
      true
    end
  end
end

