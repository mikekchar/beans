require 'domain/game'

class Snap

  attr_reader :snapped

  def initialize
    @snapped = {}
    Game::BEAN_COLOURS.each do |colour|   
      @snapped[colour] = false
    end
  end

  def is_snapable?(jars)
    jars.each do |j|
      if j.is_full?
        @snapped[j.beans[0].colour] = true
        return true
      end
    end
    false
  end
end
