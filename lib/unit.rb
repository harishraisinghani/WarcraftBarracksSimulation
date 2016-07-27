class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(enemy_unit)
    if can_attack?(enemy_unit)
      enemy_unit.damage(attack_power)
    else
      nil
    end
  end

  def damage(points)
    @health_points -= points
    @health_points = 0  if @health_points < 0
  end

  def dead?
    health_points == 0
  end

  def can_attack?(enemy_unit)
    !dead? && !enemy_unit.dead?
  end

end
