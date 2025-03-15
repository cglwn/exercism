module Blackjack
  STAND = 'S'
  private_constant :STAND
  HIT = 'H'
  private_constant :HIT
  SPLIT = 'P'
  private_constant :SPLIT
  AUTOMATICALLY_WIN = 'W'
  private_constant :AUTOMATICALLY_WIN

  CARD_VALUES = {
    'ace' => 11,
    'two' => 2,
    'three' => 3,
    'four' => 4,
    'five' => 5,
    'six' => 6,
    'seven' => 7,
    'eight' => 8,
    'nine' => 9,
    'ten' => 10,
    'jack' => 10,
    'queen' => 10,
    'king' => 10,
  }
  private_constant :CARD_VALUES

  class << self
    def parse_card(card)
      CARD_VALUES.fetch(card, 0)
    end

    def card_range(card1, card2)
      case parse_card(card1) + parse_card(card2)
      when 4..11 then 'low'
      when 12..16 then 'mid'
      when 17..20 then 'high'
      else 'blackjack'
      end
    end

    def first_turn(card1, card2, dealer_card)
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
end
