require "ui/game_controller"
require "domain/game"

describe UI::GameController do
  let(:game) { Game.new() }
  let(:game_controller) { UI::GameController.new(game) }

  it "has a jar_view" do
    expect(game_controller.jar_view).to_not be_nil
  end

  it "has a hand_view" do
    expect(game_controller.hand_view).to_not be_nil
  end
end
