require "domain/game"
require "ui/jar_view"
require "ui/hand_view"
require "ui/game_controller"

module UI
  class GameWidget
    attr_reader :controller

    def initialize(game)
      @game = game
      @controller = UI::GameController.new(game)
    end

    def render
      lines = JarView.new(@game.jars).render + 
        HandView.new(@game.hand).render
      STDOUT.puts(lines.join("\n"))
    end

    def main_loop
      render
      @controller.handle_input
    end

    def run
      while main_loop; end
    end
  end
end
