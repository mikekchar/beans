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
      when "q", "Q"
        quit
      when *@game.jar_names
        if @game.hand.empty?
          @game.hand.take_bean_from(@game.jars[input.to_i])
        else
          @game.hand.put_bean_into(@game.jars[input.to_i])
        end
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

