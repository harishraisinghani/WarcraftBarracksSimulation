require_relative 'unit'

class Peasant < Unit

  def initialize
    super(health_points,attack_power)
    @health_points = 35
    @attack_power = 0
  end
end