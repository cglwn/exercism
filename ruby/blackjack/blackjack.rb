module Blackjack
  STAND = 'S'
  HIT = 'H'
  SPLIT = 'P'
  AUTOMATICALLY_WIN = 'W'

  def self.parse_card(card)
    case card
    when 'ace' then 11
    when 'two' then 2
    when 'three' then 3
    when 'four' then 4
    when 'five' then 5
    when 'six' then 6
    when 'seven' then 7
    when 'eight' then 8
    when 'nine' then 9
    when 'ten' then 10
    when 'jack' then 10
    when 'queen' then 10
    when 'king' then 10
    else 0
    end
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when 4..11 then 'low'
    when 12..16 then 'mid'
    when 17..20 then 'high'
    else 'blackjack'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    if card1 == 'ace' && card2 == 'ace'
      return SPLIT
    end

    case card_range(card1, card2)
    when 'blackjack'
      case dealer_card
      when 'ace', 'ten', 'king', 'queen', 'jack'
        STAND
      else
        AUTOMATICALLY_WIN
      end
    when 'high'
      STAND
    when 'mid'
      case parse_card(dealer_card)
      when (7..11)
        HIT
      else
        STAND
      end
    else
      HIT
    end
  end
end
