module Chess
  FILES = 'A'..'H'
  RANKS = 1..8

  def self.valid_square?(rank, file)
    RANKS.include?(rank) && FILES.include?(file)
  end

  def self.nick_name(first_name, last_name)
    "#{first_name[..1].upcase}#{last_name[-2..].upcase}"
  end

  def self.move_message(first_name, last_name, square)
    file, rank = square[0], Integer(square[1])
    nick_name = nick_name(first_name, last_name)
    valid_square?(rank, file) ? 
      "#{nick_name} moved to #{square}" :
      "#{nick_name} attempted to move to #{square}, but that is not a valid square"
  end
end
