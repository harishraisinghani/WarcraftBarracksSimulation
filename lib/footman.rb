# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'

class Footman < Unit

  def initialize
    super(health_points,attack_power)
    @health_points = 60
    @attack_power = 10
  end


end
