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

  it "can take a bean from a jar" do
    game = Game.new
    game.take_bean
    expect(game.jar.size).to eq(29)
  end

  it "takes beans into the hand" do
    game = Game.new
    game.take_bean
    expect(game.hand).to_not be_empty
  end

  it "can not take 2 beans" do
    game = Game.new
    game.take_bean
    game.take_bean
    expect(game.jar.size).to eq(29)
  end

  it "puts beans into a jar" do
    game = Game.new
    game.take_bean
    game.put_bean
    expect(game.jar.size).to eq(30)
  end

  it "puts beans from the hand" do
    game = Game.new
    game.take_bean
    game.put_bean
    expect(game.hand).to be_empty
  end

  it "can not put beans from an empty hand" do
    game = Game.new
    game.put_bean
    expect(game.jar.size).to eq(30)
  end
end
