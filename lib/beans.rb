require 'domain/game'
require 'ui/jar_view'
require 'ui/hand_view'

game = Game.new
jar_view = UI::JarView.new(game.jars)
hand_view = UI::HandView.new(game.hand)

puts(jar_view.render.join("\n"))
puts
puts(hand_view.render)

