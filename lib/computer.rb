require './lib/board'
require './lib/cell'
require './lib/game'
require './lib/player'
require './lib/ship'

class Computer
  attr_reader :name,
              :fire_coordinates,
              :computer_board,
              :computer_cruiser,
              :computer_sub


  def initialize
    @name = 'Roald'
    @computer_cruiser = Ship.new('Cruiser', 3)
    @computer_sub = Ship.new('Submarine', 2)
    @computer_board = Board.new
    @fire_coordinates = @computer_board.cells.keys
  end
  #
  # def available_coordinates_fire
  #   fire = @computer_board.cells.keys
  # end

  # def available_coordinates_ship_placement
  #   ship_array = @computer_board.cells.keys
  # end

  def place_ships
    consecutive = available_coordinates
    #each_cons
  end

  def fire
    choice = @fire_coordinates.sample

    @computer_board.cells[choice].fire_upon
    @fire_coordinates.delete(choice)
    #need to fire on player's board not theirs
  end
end
