class GridTable
  attr_reader :rows, :columns

  def initialize(rows = 5, columns = 5)
    raise TypeError, 'Invalid rows/columns. Please enter valid values' unless rows.is_a? Integer and columns.is_a? Integer

    @rows = rows
    @columns = columns
  end

end