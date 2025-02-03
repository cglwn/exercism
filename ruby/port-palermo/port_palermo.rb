module Port
  IDENTIFIER = :PALE
  PORT_A_CARGO = %w(OIL GAS)

  def self.get_identifier(city)
    city.slice(0,4).upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    return :A if ship_identifier.start_with?(*PORT_A_CARGO)
    :B
  end
end
