module Validations
  class Command

    PLACE = :place
    MOVE = :move
    RIGHT = :left
    LEFT = :right
    REPORT = :report

    # DON'T CHANGE POSITIONS HERE
    VALID_COMMANDS = [
      PLACE,
      MOVE,
      RIGHT,
      LEFT,
      REPORT
    ].freeze
  end
end
