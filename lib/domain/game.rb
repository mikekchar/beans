require 'domain/bean'
require 'domain/hand'
require 'domain/jar'

class Game

  attr_reader :hand, :jars

  BEAN_COLOURS = Set.new(
    [:red, :green, :blue, :yellow, :black]
  )
  BEANS_PER_COLOUR = 6

  def initialize
    @hand = Hand.new
    @jars = Array.new(BEAN_COLOURS.length - 1) { Jar.new([]) }
    @jars << Jar.new(
      BEAN_COLOURS.map { |colour|
        Array.new(BEANS_PER_COLOUR) { Bean.new(colour) }
      }.flatten
    )
  end

  def take_bean_from(jar)
    hand.take_bean_from(jar)
  end

  def put_bean_into(jar)
    hand.put_bean_into(jar)
  end

end
