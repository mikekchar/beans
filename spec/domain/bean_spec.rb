require 'domain/bean'

describe Bean do

  it "should have a colour" do
    expect(Bean.new(:red).colour).to be(:red)
  end
end
