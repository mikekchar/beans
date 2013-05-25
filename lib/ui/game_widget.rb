require "domain/game"
require "ui/jar_view"
require "ui/hand_view"

module UI
  class GameWidget
    def initialize(game)
      @game = game
    end

    def render
      lines = JarView.new(@game.jars).render + 
        HandView.new(@game.hand).render
      STDOUT.puts(lines.join("\n"))
    end

    def read_input
      STDIN.gets.chop
    end

    def main_loop
      render
      read_input != "q"
    end

    def run
      while main_loop; end
    end
  end
end
