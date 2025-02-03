module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city.slice(0,4).upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    case ship_identifier.to_s.slice(0, 3)
    when 'OIL'
      :A
    when 'GAS'
      :A
    else
      :B
    end
  end
end
