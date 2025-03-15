module Acronym
  class << self
    def abbreviate phrase
      phrase
        .split(' ')
        .map { _1.split('-') }
        .flatten
        .map { _1[0].upcase }
        .join('')
    end
  end
end
