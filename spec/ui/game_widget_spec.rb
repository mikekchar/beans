require "ui/game_widget"
require "domain/game"

describe UI::GameWidget do
  let(:game) { Game.new() }
  let(:game_widget) { UI::GameWidget.new(game) }

  it "has a jar_view" do
    expect(game_widget.jar_view).to_not be_nil
  end

  it "has a hand_view" do
    expect(game_widget.hand_view).to_not be_nil
  end
end
