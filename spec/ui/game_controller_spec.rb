require "ui/game_controller"
require "domain/game"
require "domain/bean"

describe UI::GameController do
  let(:game) { Game.new() }
  let(:controller) { UI::GameController.new(game) }

  it "chops CR from input" do
    STDIN.should_receive(:gets).and_return("1\n")
    expect(controller.read_input).to eq("1")
  end

  describe "quitting" do
    it "quits with a 'q'" do
      controller.should_receive(:read_input).and_return("q")
      expect(controller.handle_input).to eq(controller.quit)
    end

    it "quits with a 'Q'" do
      controller.should_receive(:read_input).and_return("Q")
      expect(controller.handle_input).to eq(controller.quit)
    end

    it "carries on with a jar number" do
      game.jars.names.each do |name|
        controller.should_receive(:read_input).and_return(name)
        expect(controller.handle_input).to eq(controller.carry_on)
      end
    end

    it "passes with an empty string" do
      controller.should_receive(:read_input).and_return("")
      game.should_receive(:pass)
      expect(controller.handle_input).to eq(controller.carry_on)
    end
  end

  context "hand is empty" do
    it "takes a bean if a jar number is entered" do
      game.jars.names.each do |name|
        controller.stub(:read_input).and_return(name)
        game.should_receive(:take_bean_from).with(game.jars[name.to_i - 1])
        expect(controller.handle_input).to eq(controller.carry_on)
      end
    end
  end

  context "hand is full" do
    it "puts a bean if a jar number is entered" do
      game.hand.bean = Bean.new(:red)
      expect(game.hand).to_not be_empty
      controller.stub(:read_input).and_return("1")
      game.should_receive(:put_bean_into).with(game.jars[0])
      expect(controller.handle_input).to eq(controller.carry_on)
    end
  end

end
