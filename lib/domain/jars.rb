require 'domain/jar'

class Jars < Array
  def initialize(size)
    super(size) { Jar.new([]) }
  end

  def names
    [*1..size].map do |num| num.to_s end
  end

  def get(string)
    fetch(string.to_i - 1)
  end

  def toggle_state(turn)
    names.each do |name|
      if (turn % name.to_i) == 0
        get(name).open
      else
        get(name).close
      end
    end
  end
end
