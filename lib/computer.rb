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
    @cruiser_ship_coordinates = []
    @sub_ship_coordinates = []
  end

  def create_horizontal_cruiser_coordinates
    @fire_coordinates.each_cons(3) { |pair| @cruiser_ship_coordinates << pair}
  end

  def create_vertical_cruiser_coordinates
    vertical = @fire_coordinates.sort_by do |coordinate|
      coordinate[1]
    end
    vertical.each_cons(3) { |pair| @cruiser_ship_coordinates << pair}
  end

  def create_horizontal_sub_coordinates
    @fire_coordinates.each_cons(2) { |pair| @sub_ship_coordinates << pair}
  end

  def create_vertical_sub_coordinates
    vertical = @fire_coordinates.sort_by do |coordinate|
      coordinate[1]
    end
    vertical.each_cons(2) { |pair| @sub_ship_coordinates << pair}
  end

  def place_cruiser
    until @computer_board.valid_placement?(@computer_cruiser, coordinates = @cruiser_ship_coordinates.sample)
      loop
    end
    @computer_board.place(@computer_cruiser, coordinates)
  end

  def place_sub
    until @computer_board.valid_placement?(@computer_sub, coordinates = @sub_ship_coordinates.sample)
      loop
    end
    @computer_board.place(@computer_sub, coordinates)
  end




  def fire
    choice = @fire_coordinates.sample

    @computer_board.cells[choice].fire_upon
    @fire_coordinates.delete(choice)
    #need to fire on player's board not theirs
  end
end
