require "domain/game"
require "ui/jar_view"
require "ui/hand_view"

module UI
  class GameWidget
    attr_reader :jar_view, :hand_view
    def initialize(game)
      @game = game
      @jar_view = JarView.new(game.jars)
      @hand_view = HandView.new(game.hand)
    end

    def render
      jar_view.render + hand_view.render
    end

    def read_input
      STDIN.gets
    end

    def main_loop
      input = nil
      while input != "q" do
        STDOUT.puts(render.join("\n"))
        input = read_input
      end
    end
  end
end
