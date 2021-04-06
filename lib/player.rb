class Player
  attr_reader :player_board,
              :player_cruiser,
              :player_sub

  def initialize
    @player_board = Board.new
    @player_cruiser = Ship.new('Cruiser', 3)
    @player_sub = Ship.new('Sub', 2)
  end

  def place_cruiser(coordinates, ship = @player_cruiser)
    if @player_board.valid_placement?(ship, coordinates) != true
      puts 'Sorry, those coordinates are invalid, please try again'
      false
    else
      puts 'Your cruiser has been set'
      @player_board.place(ship, coordinates)
      true
      end
  end

  def place_sub(coordinates, ship = @player_sub)
    if @player_board.valid_placement?(ship, coordinates) != true
      puts 'Sorry, those coordinates are invalid, please try again'
      false
    else
      puts 'Your sub has been set'
      @player_board.place(ship, coordinates)
      true
    end
  end
end
#player needs to be able to:
#set ships
#take shots
