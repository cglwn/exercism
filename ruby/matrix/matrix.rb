class Matrix
  def initialize str
    @data = []
    str
      .split("\n")
      .each do |row_str|
        row = row_str.split(' ').map(&:to_i)
        @data << row
      end
  end

  def row row_idx
    return @data[row_idx - 1]
  end

  def column col_idx
    @data.map { |r| r[col_idx - 1] }
  end
end
