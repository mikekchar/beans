module UI
  class TurnView

    def initialize(turn)
      @info = turn
    end

    def render
      ["Turn: #{@info}"]
    end
  end
end



