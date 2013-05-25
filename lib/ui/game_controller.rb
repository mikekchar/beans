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
      status = true
      case read_input
      when "q", "Q"
        status = quit
      else
        status = carry_on
      end
      status
    end

    def quit
      false
    end

    def carry_on
      true
    end
  end
end

