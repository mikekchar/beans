require 'game'
describe Game do

  subject(:game) { Game.new }

  describe "the hand" do
    it "is initially empty" do
      expect(game.hand).to be_empty
    end

    it "takes beans" do
      game.take_bean
      expect(game.hand).to_not be_empty
      expect(game.jar.size).to eq(29)
    end

    it "can not take 2 beans" do
      expect(game.jar.size).to eq(30)
      game.take_bean
      game.take_bean
      expect(game.jar.size).to eq(29)
    end

    it "puts beans somewhere" do
      game.take_bean
      expect(game.jar.size).to eq(29)
      game.put_bean
      expect(game.hand).to be_empty
      expect(game.jar.size).to eq(30)
    end

    it "can not put beans when empty" do
      expect(game.jar.size).to eq(30)
      game.put_bean
      expect(game.jar.size).to eq(30)
    end
  end

  describe "the last jar" do
    it "initially has 30 beans" do
      expect(game.jar.size).to eq(30)
    end

    it "has 6 red beans" do
      expect(game.jar.beans_that_are(:red).size).to eq(6)
    end
    it "has 6 green beans" do
      expect(game.jar.beans_that_are(:green).size).to eq(6)
    end
    it "has 6 blue beans" do
      expect(game.jar.beans_that_are(:blue).size).to eq(6)
    end
    it "has 6 yellow beans" do
      expect(game.jar.beans_that_are(:yellow).size).to eq(6)
    end
    it "has 6 black beans" do
      expect(game.jar.beans_that_are(:black).size).to eq(6)
    end
  end

  describe Game::Jar do
    it "allows beans to be taken" do
      game.take_bean
      expect(game.jar.size).to eq(29)
    end

    it "receives beans that are put" do
      game.take_bean
      expect(game.jar.size).to eq(29)
      game.put_bean
      expect(game.jar.size).to eq(30)
    end

    it "is not empty" do
      expect(game.jar.size).to eq(30)
      expect(game.jar).to_not be_empty
    end
  end

end
