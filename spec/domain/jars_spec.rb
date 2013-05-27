require 'domain/jars'

describe Jar do
  subject(:jars) { Jars.new(5) }

  it "has a size" do
    expect(jars.size).to eq(5)
  end

  it "has names" do
    expect(jars.names).to eq(["1", "2", "3", "4", "5"])
  end

  it "can get the jar using the name" do
    jars.names.each_index do |i|
      expect(jars.get(jars.names[i])).to be(jars[i])
    end
  end
end

