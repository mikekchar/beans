require "ui/game_widget"
require "domain/game"

describe UI::GameWidget do
  let(:game) { Game.new() }
  let(:widget) { UI::GameWidget.new(game) }

  describe "rendering" do
    it "renders the views" do
      UI::JarView.any_instance.should_receive(:render).and_return([1,2])
      UI::HandView.any_instance.should_receive(:render).and_return([3,4])
      STDOUT.should_receive(:puts).with("1\n2\n3\n4")
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
