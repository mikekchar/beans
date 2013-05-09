require 'game'
describe Game do

  subject(:game) { Game.new }

  describe "the jars" do
    it "has as many jars as bean colours" do
      expect(game.jars.size).to eq(Game::BEAN_COLOURS.size)
    end

    it "has mostly empty jars" do
      game.jars[0..Game::BEAN_COLOURS.size - 2].each { |jar|
        expect(jar.size).to eq(0)
      }
    end

    describe "the last jar" do
      subject(:last_jar) { game.jars[Game::BEAN_COLOURS.size - 1]  }

      it "initially has all the beans" do
        total_beans = Game::BEAN_COLOURS.size * Game::BEANS_PER_COLOUR 
        expect(last_jar.size).to eq(total_beans)
      end

      it "has an equal number of beans for each colour" do
        Game::BEAN_COLOURS.each do |colour|
          number_of_beans = last_jar.beans_that_are(colour).size
          expect(number_of_beans).to eq(Game::BEANS_PER_COLOUR)
        end
      end
    end
  end

  describe "playing with beans" do

    let(:last_jar) { game.jars[Game::BEAN_COLOURS.size - 1]  }

    it "starts with an empty hand" do
      expect(game.hand).to be_empty
    end

    describe "taking beans" do

      before(:each) do
        game.take_bean_from(last_jar)
      end

      it "puts beans into the hand" do
        expect(game.hand).to_not be_empty
      end

      it "takes the bean from the jar" do
        beans_left = last_jar.beans_that_are(game.hand.bean.colour).size 
        expect(beans_left).to eq(Game::BEANS_PER_COLOUR - 1)
      end
    end

    describe "putting beans" do
      let(:first_jar) { game.jars[0] }

      before(:each) do
        game.take_bean_from(last_jar)
        @colour = game.hand.bean.colour
        game.put_bean_into(first_jar)
      end

      it "ends up with an empty hand" do
        expect(game.hand).to be_empty
      end

      it "puts the bean in the jar" do
        expect(first_jar.beans_that_are(@colour).size).to eq(1)
      end
    end
  end

  describe "open and closed jars" do
    let(:first_jar) { game.jars[0] }
    let(:last_jar) { game.jars[Game::BEAN_COLOURS.size - 1] }

    describe "the first jar" do
      it "is always open" do
        number_of_beans = last_jar.size
        number_of_beans.times do
          game.take_bean_from(last_jar)
          game.put_bean_into(first_jar)
        end
        expect(last_jar.size).to eq(0)
        expect(first_jar.size).to eq(number_of_beans)
      end
    end

  end
end
