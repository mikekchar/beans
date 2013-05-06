require 'game'
describe Game do

  subject(:game) { Game.new }

  describe "the jars" do
    it "has 5 jars" do
      expect(game.jars.size).to eq(5)
    end
  end

  describe "the last jar" do
    it "initially has 30 beans" do
      expect(game.jars[4].size).to eq(30)
    end

    it "has 6 red beans" do
      expect(game.jars[4].beans_that_are(:red).size).to eq(6)
    end
    it "has 6 green beans" do
      expect(game.jars[4].beans_that_are(:green).size).to eq(6)
    end
    it "has 6 blue beans" do
      expect(game.jars[4].beans_that_are(:blue).size).to eq(6)
    end
    it "has 6 yellow beans" do
      expect(game.jars[4].beans_that_are(:yellow).size).to eq(6)
    end
    it "has 6 black beans" do
      expect(game.jars[4].beans_that_are(:black).size).to eq(6)
    end
  end
end
