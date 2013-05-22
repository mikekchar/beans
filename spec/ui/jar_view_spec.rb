require "ui/jar_view"
require "domain/jar"

describe UI::JarView do
  let(:jars) { Array.new(5) { Jar.new } }
  let(:jar_view) { UI::JarView.new(jars) }

  it "has the right number of jars" do
    expect(jars.size).to eq(5)
  end

  it "writes the numbers of the jar" do
    expect(jar_view.render[0]).to eq("   0      1      2      3      4   ")
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
