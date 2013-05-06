require 'jar'
require 'bean'

describe Jar do
  subject(:jar) { Jar.new }
  subject(:bean) { Bean.new(:red) }

  it "constructs an empty jar by default" do
    expect(jar.size).to eq(0)
  end

  it "tells me when it is empty" do
    expect(jar).to be_empty
  end

  it "allows beans to be put and taken" do
    jar.put_bean(bean)
    expect(jar.size).to eq(1)
    expect(jar.take_bean).to be(bean)
    expect(jar.size).to eq(0)
  end

  it "gives me all the beans of specific colours" do
    yellow_beans = Array.new(6) { Bean.new(:yellow) }
    red_beans = Array.new(3) { Bean.new(:red) }
    green_beans = Array.new(2) { Bean.new(:green) }
    yellow_beans.each { |bean| jar.put_bean(bean) }
    red_beans.each { |bean| jar.put_bean(bean) }
    green_beans.each { |bean| jar.put_bean(bean) }

    expect(jar.size).to eq(11)
    expect(jar.beans_that_are(:red).size).to eq(3)
  end

end
