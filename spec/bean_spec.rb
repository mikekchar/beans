require 'bean'

describe Bean do

  it "has a choice of 5 colours" do 
    expect(Bean).to have_colour(:red)
    expect(Bean).to have_colour(:green)
    expect(Bean).to have_colour(:blue)
    expect(Bean).to have_colour(:yellow)
    expect(Bean).to have_colour(:black)
  end

  it "should raise a ArgumentError for invalid colours" do
    expect{ Bean.new(:mauve) }.to raise_error(ArgumentError)
  end

  it "should have a colour" do
    expect(Bean.new(:red).colour).to be(:red)
  end
end
