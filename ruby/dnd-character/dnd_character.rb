class DndCharacter
  BASE_HITPOINTS = 10

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

  attr_reader :strength
  attr_reader :dexterity
  attr_reader :constitution
  attr_reader :intelligence
  attr_reader :wisdom
  attr_reader :charisma
  attr_reader :hitpoints
  
  def initialize
    @prng = Random.new

    @strength = roll_stat
    @dexterity = roll_stat
    @constitution = roll_stat
    @intelligence = roll_stat
    @wisdom = roll_stat
    @charisma = roll_stat

    @hitpoints = BASE_HITPOINTS + DndCharacter.modifier(@constitution)
  end

  private
    def roll_stat
      rolls = [@prng.rand(1..6), @prng.rand(1..6), @prng.rand(1..6), @prng.rand(1..6)]
      rolls.max(3).sum
    end
end
