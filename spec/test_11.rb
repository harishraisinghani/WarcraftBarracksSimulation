require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
    @footman = Footman.new
  end

  it "has and knows its HP (health points)" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the barracks's health_points by half the attack_power specified" do
      @barracks.damage(@footman)
      expect(@barracks.health_points).to eq(495) # HP started at 500 but just got hit by ceiling of 31/2 = 16 (see subject)
    end
  end

end
