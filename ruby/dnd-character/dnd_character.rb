class DndCharacter
  BASE_HITPOINTS = 10

  def self.modifier modifier
    case modifier
    when 3, 4
      modifier - 7
    when 5, 6
      modifier - 8
    when 7, 8
      modifier - 9
    when 9, 10
      modifier - 10
    when 11, 12
      modifier - 11
    when 13, 14
      modifier - 12
    when 15, 16
      modifier - 13
    when 17, 18
      modifier - 14
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
