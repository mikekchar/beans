require 'ui/turn_view'

describe UI::TurnView do
  let(:hand_view) { UI::TurnView.new(1) }

  it "shows the turn" do
    expect(hand_view.render[0]).to eq("Turn: 1")
  end
end

