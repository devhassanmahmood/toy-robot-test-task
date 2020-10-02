module Validations
  class Position

    def self.valid?(x, y, grid)
      (x >= 0 && x <= grid.columns && y >= 0 && y <= grid.rows)
    end
  end
end
