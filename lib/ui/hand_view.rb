module UI
  class HandView

    class HandInfo
      attr_reader :colour

      def initialize(hand)
        if hand.empty?
          @colour = "empty"
        else
          @colour = hand.bean.colour.to_s
        end
      end
    end

    def initialize(hand)
      @info = HandInfo.new(hand)
    end

    def render
      return ["","Hand: #{@info.colour}"]
    end
  end
end

