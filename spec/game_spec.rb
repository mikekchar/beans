require 'game'

describe Game do
  it "has a hand that is initially empty" do
    game = Game.new
    expect(game.hand).to be_empty
  end

  it "has a jar that initially has 30 beans" do
    game = Game.new
    expect(game.jar.size).to eq(30)
  end

  it "can take a bean from a jar and put it in the hand" do
    game = Game.new
    game.take
    expect(game.hand).to_not be_empty
  end
end
