require 'hand'
require 'jar'

describe Hand do
  subject(:hand) { Hand.new }
  let(:jar) { Jar.new(Array.new(30) { "bean" }) }

  it "is initially empty" do
    expect(hand).to be_empty
  end

  it "takes beans" do
    hand.take_bean_from(jar)
    expect(hand).to_not be_empty
    expect(jar.size).to eq(29)
  end

  it "can not take 2 beans" do
    expect(jar.size).to eq(30)
    hand.take_bean_from(jar)
    hand.take_bean_from(jar)
    expect(jar.size).to eq(29)
  end

  it "puts beans somewhere" do
    hand.take_bean_from(jar)
    expect(jar.size).to eq(29)
    hand.put_bean_into(jar)
    expect(hand).to be_empty
    expect(jar.size).to eq(30)
  end

  it "can not put beans when empty" do
    expect(jar.size).to eq(30)
    hand.put_bean_into(jar)
    expect(jar.size).to eq(30)
  end

  it "can not put beans into closed things" do
    hand.take_bean_from(jar)
    expect(jar.size).to eq(29)
    jar.close
    hand.put_bean_into(jar)
    expect(hand).to_not be_empty
    expect(jar.size).to eq(29)
  end

end
