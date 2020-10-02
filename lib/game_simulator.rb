require_relative 'toy'
require_relative 'grid_table'

class GameSimulator

  def initialize
    @grid_table = GridTable.new
    @toy = Toy.new(@grid_table)
  end

  def call(command)
    begin
      puts @toy.perform(command)
    rescue Exception => e
      puts e.message
    end
  end
end
