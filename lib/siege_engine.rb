require_relative 'unit'

class SiegeEngine < Unit

  def initialize
    super(health_points,attack_power)
    @health_points = 400
    @attack_power = 50
  end

  def can_attack?(unit_or_building)
    (unit_or_building.class == Barracks || unit_or_building.class == SiegeEngine) && !dead? && !unit_or_building.dead?
  end
end
