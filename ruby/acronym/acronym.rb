module Acronym
  class << self
    def abbreviate phrase
      phrase
        .scan(/[A-Za-z]+/)
        .map { _1[0].upcase }
        .join('')
    end
  end
end
