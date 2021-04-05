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
              :computer_sub,
              :ship_coordinates


  def initialize
    @name = 'Roald'
    @computer_cruiser = Ship.new('Cruiser', 3)
    @computer_sub = Ship.new('Submarine', 2)
    @computer_board = Board.new
    @fire_coordinates = @computer_board.cells.keys
    @ship_coordinates = []
  end

  def create_ship_coordinates
    @fire_coordinates.each_cons(3) { |a| @ship_coordinates << a}
  end
  
  def place_cruiser
    possible = @fire_coordinates.sample(3)
    loop do
      @computer_board.valid_placement?(@computer_cruiser, [possible])
      possible = @fire_coordinates.sample(3)
      if @computer_board.valid_placement?(@computer_cruiser, [possible]) == true
        @computer_board.place(@computer_cruiser, [possible])
        break
      end
    end
  end

  def fire
    choice = @fire_coordinates.sample

    @computer_board.cells[choice].fire_upon
    @fire_coordinates.delete(choice)
    #need to fire on player's board not theirs
  end
end
