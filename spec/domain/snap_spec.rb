require 'domain/snap'
require 'domain/jars'
require 'domain/jar'
require 'domain/bean'
require 'domain/game'

describe Snap do
  let(:snap) { Snap.new }

  it "has hash of false values of every colour" do
    Game::BEAN_COLOURS.each do |colour|
      expect(snap.snapped[colour]).to be_false
    end
  end

  context "winning conditions" do
    let(:a_bean) { Bean.new(:blue) }
    let(:winning_jar) { Jar.new([a_bean, a_bean, a_bean, a_bean, a_bean, a_bean]) }
    let(:winning_jars) do
      jars = Jars.new(Game::BEAN_COLOURS.length)
      jars[0] = winning_jar
      jars
    end

    it "#is_snapable? returns true" do
      expect(snap.is_snapable?(winning_jars)).to be_true
    end
  end

  context "not-yet-winning conditions" do
    let(:a_bean) { Bean.new(:red) }
    let(:rogue_bean) { Bean.new(:black) }
    let(:losing_jar) { Jar.new([rogue_bean, a_bean, a_bean, a_bean, a_bean, a_bean]) }
    let(:losing_jars) do
      jars = Jars.new(Game::BEAN_COLOURS.length)
      jars[0] = losing_jar
      jars
    end

    it "#is_snapable? returns false" do
      expect(snap.is_snapable?(losing_jars)).to be_false
    end
  end
end
