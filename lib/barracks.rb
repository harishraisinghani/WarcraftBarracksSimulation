require_relative 'footman'
require_relative 'peasant'
require_relative 'siege_engine'

class Barracks

  attr_reader :health_points, :gold, :food, :lumber

  def initialize
    @health_points = 500
    @gold = 1000
    @food = 80
    @lumber = 500
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    else
      nil
    end

  end

  def can_train_footman?
    food >= 2 && gold >=135
  end

  def can_train_peasant?
    food >=5 && gold >=90
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    else
      nil
    end
  end

  def can_build_siege_engine?
    food >=3 && gold >=200 && lumber >= 60
  end

  def build_siege_engine
    if can_build_siege_engine?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      SiegeEngine.new
    else
      nil
    end
  end

  def damage(unit)
    if unit.is_a? Footman
      @health_points -= (unit.attack_power.to_f/2).ceil
    elsif unit.is_a? SiegeEngine
      @health_points -= unit.attack_power*2
    end
  end

  def dead?
    health_points == 0
  end
end
