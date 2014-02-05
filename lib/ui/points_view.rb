module UI
  class PointsView
    def initialize(points, winnings)
      @info = points
      @winnings = winnings
    end

    def render
      ["Points: #{@info} >>> Winnings: #{@winnings}"]
    end
  end
end
