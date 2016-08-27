require 'spec_helper'
require '05_composite/task'

describe "Composite Pattern" do

  it "estimates leaf tasks correctly" do
    expect(BoilWater.new.estimate).to eq(10)
    expect(OpenRamenPacket.new.estimate).to eq(0.25)
    expect(AddNoodles.new.estimate).to eq(5)
    expect(AddSeasoning.new.estimate).to eq(1)
  end

  it "estimates composite task correct" do
    expect(MakeRamen.new.estimate).to eq(16.25)
  end
end
