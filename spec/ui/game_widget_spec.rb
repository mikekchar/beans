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

  it "renders the views" do
    expect(game_widget.render.size).to eq(6)
  end

  it "reads from input" do
    STDIN.should_receive(:gets).and_return("1")
    expect(game_widget.read_input).to eq("1")
  end

  context "main loop" do
    it "exits on 'q'" do
      game_widget.should_receive(:read_input).and_return("q")
      game_widget.main_loop
    end
  end
end
