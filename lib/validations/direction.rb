module Validations
  class Direction

    NORTH = :north
    EAST = :east
    WEST = :west
    SOUTH = :south

    # DON'T CHANGE POSITIONS HERE
    VALID_DIRECTIONS = [
      NORTH,
      EAST,
      SOUTH,
      WEST
    ].freeze

    def self.step_in_direction(direction)
      next_direction = { x: 0, y: 0}

      next_direction[:y] = 1 if direction === NORTH
      next_direction[:x] = 1 if direction === EAST
      next_direction[:y] = -1 if direction === SOUTH
      next_direction[:x] = -1 if direction === WEST

      return next_direction
    end
  end
end
