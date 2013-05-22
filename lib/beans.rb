require 'domain/game'
require 'ui/game_widget'

game = Game.new
widget = UI::GameWidget.new(game)

puts widget.render.join("\n")
