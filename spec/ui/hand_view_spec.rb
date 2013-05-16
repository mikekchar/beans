require 'ui/hand_view'
require 'domain/hand'
require 'domain/jar'
require 'domain/bean'

module UI
  describe HandView do
    let(:hand) { Hand.new }
    let(:hand_view) { UI::HandView.new(hand) }
    let(:jar) { Jar.new([Bean.new(:red)]) }

    it "shows an empty hand" do
      expect(hand).to be_empty
      expect(hand_view.render).to eq("Hand: empty")
    end

    it "shows the correct bean" do
      hand.take_bean_from(jar)
      expect(hand).to_not be_empty
      expect(hand_view.render).to eq("Hand: red")
    end
  end
end
