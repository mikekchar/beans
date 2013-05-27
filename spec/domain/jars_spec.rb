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

  context "toggling the appropriate jars" do
    it "has all jars open on the first turn" do
      jars.each do |jar|
        expect(jar).to be_open
      end
    end
    it "opens and closes the appropriate jars" do
      2.upto(100) do |i|
        jars.toggle_state(i)
        jars.each_index do |j|
          if (i % (j+1)) == 0
            expect(jars[j]).to be_open
          else
            expect(jars[j]).to_not be_open
          end
        end
      end
    end
  end
end

