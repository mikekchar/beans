require "ui/jar_view"
require "domain/jars"

describe UI::JarView do
  let(:jars) { Jars.new(5) }
  let(:jar_view) { UI::JarView.new(jars) }

  describe "rendering the header" do
    it "writes the numbers of the jar" do
      expect(jar_view.render[0]).to eq("   1      2      3      4      5   ")
    end

    it "writes closed jars as -" do
      jars.first.close
      expect(jar_view.render[0]).to eq("   -      2      3      4      5   ")
    end
  end

  it "writes the number of red and green beans in the jar" do
    expect(jar_view.render[1]).to eq(" R0 G0  R0 G0  R0 G0  R0 G0  R0 G0 ")
  end

  it "writes the number of blue and yellow beans in the jar" do
    expect(jar_view.render[2]).to eq(" B0 Y0  B0 Y0  B0 Y0  B0 Y0  B0 Y0 ")
  end

  it "writes the number of black beans in the jar" do
    expect(jar_view.render[3]).to eq("  BL0    BL0    BL0    BL0    BL0  ")
  end
end
