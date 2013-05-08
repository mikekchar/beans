require 'game'
describe Game do

  subject(:game) { Game.new }

  describe "the jars" do
    it "has as many jars as bean colours" do
      expect(game.jars.size).to eq(Game::BEAN_COLOURS.size)
    end
  end

  describe "the last jar" do

    subject(:last_jar) { game.jars[Game::BEAN_COLOURS.size - 1]  }

    it "initially has 30 beans" do
      expect(last_jar.size).to eq(30)
    end

    it "has a specific number of beans for each colour" do
      Game::BEAN_COLOURS.each do |colour|
        expect(last_jar.beans_that_are(colour).size).to eq(Game::BEANS_PER_COLOUR)
      end
    end
  end
end
