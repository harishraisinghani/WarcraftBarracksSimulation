require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
  end

  describe "#dead?" do
    it "should return true if health points is equal to 0" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be true
    end


    it "should return false if health points are greater than 0" do
      expect(@unit.dead?).to be false  
    end
  end

  describe "#attack!" do

    it "should not be able to attack enemy if unit is dead" do
      enemy_unit = Unit.new(100, 3)
      expect(@unit).to receive(:dead?).and_return(true)
      expect(@unit.attack!(enemy_unit)).to be_nil
    end

    it "should not be able to attack a dead enemy" do
      enemy_unit = Unit.new(0, 3)
      expect(enemy_unit).to receive(:dead?).and_return(true)
      expect(@unit.attack!(enemy_unit)).to be_nil
    end

  end


end