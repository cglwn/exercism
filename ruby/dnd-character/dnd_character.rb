class DndCharacter
  BASE_HITPOINTS = 10
  STATS = %i[strength dexterity constitution intelligence wisdom charisma]
  private_constant :STATS

  attr_reader *STATS

  def self.modifier modifier
    case modifier
    when 3 then -4
    when 4, 5 then -3
    when 6, 7 then -2
    when 8, 9 then -1
    when 10, 11 then 0
    when 12, 13 then 1
    when 14, 15 then 2
    when 16, 17 then 3
    when 18 then 4
    else
      raise ArgumentError.new("Modifier must be in range (3..18)")
    end
  end

  def initialize
    @prng = Random.new

    STATS.each do |stat|
      instance_variable_set("@#{stat}", roll_stat)
    end
  end

  def hitpoints
    BASE_HITPOINTS + DndCharacter.modifier(@constitution)
 end

  private
    def roll_stat
      rolls = [@prng.rand(1..6), @prng.rand(1..6), @prng.rand(1..6), @prng.rand(1..6)]
      rolls.max(3).sum
    end
end
