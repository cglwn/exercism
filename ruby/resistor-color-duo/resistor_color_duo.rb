module ResistorColorDuo
  COLOR_VALUE = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9,
  }

  private_constant :COLOR_VALUE
  class << self
    def value colors
      colors
        .first(2)
        .map { COLOR_VALUE[_1] }
        .join('')
        .to_i
    end
  end
end
