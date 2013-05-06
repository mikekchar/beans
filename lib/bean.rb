class Bean
  COLOURS = Set.new([:red, :green, :blue, :yellow, :black])
  attr_reader :colour

  def self.has_colour?(colour)
    COLOURS.include?(colour)
  end

  def initialize(colour)
    if !Bean.has_colour?(colour)
      raise ArgumentError 
    end
    @colour = colour
  end
end
