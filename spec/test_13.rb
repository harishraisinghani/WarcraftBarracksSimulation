require_relative 'spec_helper'

describe Barracks do

  before :each do
    @barracks = Barracks.new
    @siege_engine = SiegeEngine.new

  end

  it "starts off 500 lumber resources" do
    expect(@barracks.lumber).to eq(500)
  end

  describe "#build_siege_engine" do

    it "costs 200 gold" do
      @barracks.build_siege_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 3 food" do
      @barracks.build_siege_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

    it "costs 60 lumber" do
      @barracks.build_siege_engine
      expect(@barracks.lumber).to eq(440) # starts at 500
    end


    it "produces a SiegeEngine unit" do
      siege_engine = @barracks.build_siege_engine
      expect(siege_engine).to be_an_instance_of(SiegeEngine)
    end
  end

  describe "#can_build_siege_engine?" do

    it "returns true if there are enough resources to build a Siege Engine" do
      expect(@barracks.can_build_siege_engine?).to be true
    end

    it "returns false if there isn't enough food" do
      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_build_siege_engine?).to be false
    end

    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_build_siege_engine?).to be false
    end

    it "returns false if there isn't enough lumber" do
      expect(@barracks).to receive(:gold).and_return(59)
      expect(@barracks.can_build_siege_engine?).to be false
    end
  end

  describe "#damage" do
    it "should reduce the barracks's health_points by twice the attack_power specified" do
      @barracks.damage(@siege_engine)
      expect(@barracks.health_points).to eq(400) # HP started at 500 but just got hit by 2x SiegeEngine's attack power
    end
  end

end

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe "#can_attack?" do

    it "should be able to attack Barracks" do
      enemy = Barracks.new
      expect(@siege_engine.can_attack?(enemy)).to be true
    end

    it "should be able to attack other Siege Engines" do
      enemy = SiegeEngine.new
      expect(@siege_engine.can_attack?(enemy)).to be true
    end

    it "should not be able to attack Peasants" do
      enemy = Peasant.new
      expect(@siege_engine.can_attack?(enemy)).to be false
    end

    it "should not be able to attack Footman" do
      enemy = Footman.new
      expect(@siege_engine.can_attack?(enemy)).to be false
    end
  end

  describe "attack!" do
    it "should do deal 50 (AP) damage to another Siege Engine enemy unit" do
      enemy = SiegeEngine.new
      expect(enemy).to receive(:damage).with(50)
      @siege_engine.attack!(enemy)
    end
  end

  describe "#damage" do
   it "should reduce the unit's health_points by the attack_power specified" do
      @siege_engine.damage(50)
     expect(@siege_engine.health_points).to eq(350) # starts at 400
    end
  end
end

