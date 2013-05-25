require "ui/game_controller"
require "domain/game"

describe UI::GameController do
  let(:game) { Game.new() }
  let(:controller) { UI::GameController.new(game) }

  it "chops CR from input" do
    STDIN.should_receive(:gets).and_return("1\n")
    expect(controller.read_input).to eq("1")
  end

  describe "quitting" do
    it "quits on a 'q'" do
      controller.should_receive(:read_input).and_return("q")
      expect(controller.handle_input).to be_false
    end

    it "quits on a 'Q'" do
      controller.should_receive(:read_input).and_return("Q")
      expect(controller.handle_input).to be_false
    end

    it "continues on a '1'" do
      controller.should_receive(:read_input).and_return("1")
      expect(controller.handle_input).to be_true
    end
  end

  context "hand is empty" do
    it "takes a bean if a number is entered" do
      controller.stub(:read_input).and_return("0")
      game.hand.should_receive(:take_bean_from).with(game.jars[0])
      expect(controller.handle_input).to be_true
    end
  end

end
