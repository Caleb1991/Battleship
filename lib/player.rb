class Player
  attr_reader :player_board,
              :player_cruiser,
              :player_sub

  def initialize
    @player_board = Board.new
    @player_cruiser = Ship.new('Cruiser', 3)
    @player_sub = Ship.new('Sub', 2)
  end

#player needs to be able to:
#set ships
#take shots

end
