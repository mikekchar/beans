module UI
  class PointsView
    def initialize(points)
      @info = points
    end

    def render
      ["Points: #{@info}"]
    end
  end
end
