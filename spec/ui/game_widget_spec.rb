require "ui/game_widget"
require "domain/game"

describe UI::GameWidget do
  let(:game) { Game.new() }
  let(:game_widget) { UI::GameWidget.new(game) }

  it "renders the views" do
    UI::JarView.any_instance.should_receive(:render).and_return([1,2])
    UI::HandView.any_instance.should_receive(:render).and_return([3,4])
    STDOUT.should_receive(:puts).with("1\n2\n3\n4")
    game_widget.render
  end

  it "reads from input" do
    STDIN.should_receive(:gets).and_return("1\n")
    expect(game_widget.read_input).to eq("1")
  end

  context "main loop" do
    it "exits on 'q'" do
      game_widget.stub(:render)
      game_widget.should_receive(:read_input).and_return("q")
      game_widget.main_loop
    end
  end
end
