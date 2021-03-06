require "ui/game_widget"
require "domain/game"

describe UI::GameWidget do
  let(:game) { Game.new() }
  let(:widget) { UI::GameWidget.new(game) }

  describe "rendering" do
    it "renders the views" do
      UI::PointsView.any_instance.should_receive(:render).and_return([0])
      UI::TurnView.any_instance.should_receive(:render).and_return([1])
      UI::JarView.any_instance.should_receive(:render).and_return([2,3])
      UI::HandView.any_instance.should_receive(:render).and_return([4,5])
      STDOUT.should_receive(:puts).with("0\n1\n2\n3\n4\n5")
      widget.render
    end
  end

  context "main loop" do

    it "renders" do
      widget.controller.stub(:handle_input)
      widget.should_receive(:render)
      widget.main_loop
    end

    it "handles input" do
      widget.stub(:render)
      widget.controller.should_receive(:handle_input)
      widget.main_loop
    end

    it "exits when the controller says so" do
      widget.stub(:render)
      widget.controller.stub(:handle_input).and_return(false)
      expect(widget.main_loop).to be_false
    end

    it "exits when the controller says so" do
      widget.stub(:render)
      widget.controller.stub(:handle_input).and_return(true)
      expect(widget.main_loop).to be_true
    end
  end
end
