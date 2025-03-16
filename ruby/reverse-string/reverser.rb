module Reverser
  class << self
    def reverse str
      len = str.length
      (0...str.length/2).each do |idx|
        str[idx], str[len - (idx + 1)] = str[len - (idx + 1)], str[idx]
      end
      str
    end
  end
end
