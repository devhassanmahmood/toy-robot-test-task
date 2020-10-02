require_relative 'validations/direction'
require_relative 'validations/command'
require_relative 'validations/position'
require_relative 'processors/command'

class Toy
  attr_reader :position, :direction, :grid_table

  def initialize(grid_table)
    raise TypeError, 'Invalid Grid' if grid_table.nil?

    @grid_table = grid_table
  end

  def perform(instruction)
    return if instruction.strip.empty?

    command_action = ::Processors::Command.interpret(instruction)
    send(command_action[:method_name], *command_action[:params])
  end

  def place(x, y, direction)
    raise TypeError, 'Invalid coordinates' unless x.is_a? Integer and y.is_a? Integer
    raise TypeError, 'Invalid direction' unless ::Validations::Direction::VALID_DIRECTIONS.include?(direction)

    if ::Validations::Position.valid?(x, y, self.grid_table)
      @position = { x: x, y: y } and @direction = direction
      true
    else
      false
    end
  end

  def move
    return false if @position.nil?

    movement = ::Validations::Direction.step_in_direction(@direction)

    if ::Validations::Position.valid?(@position[:x] + movement[:x], @position[:y] + movement[:y], self.grid_table)
      @position = { x: @position[:x] + movement[:x], y: @position[:y] + movement[:y] } and return true
    end

    false
  end

  def rotate_left
    return false if @direction.nil?

    rotate_index = ::Validations::Direction::VALID_DIRECTIONS.index(@direction)
    @direction = ::Validations::Direction::VALID_DIRECTIONS.rotate(-1)[rotate_index]
  end

  def rotate_right
    return false if @direction.nil?

    rotate_index = ::Validations::Direction::VALID_DIRECTIONS.index(@direction)
    @direction = ::Validations::Direction::VALID_DIRECTIONS.rotate()[rotate_index]
  end

  def report
    return "Not on grid" if @position.nil? or @direction.nil?

    "#{@position[:x]},#{@position[:y]},#{@direction.to_s.upcase}"
  end
end
