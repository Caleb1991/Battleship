require './lib/cell'
require './lib/game'
require './lib/player'
require './lib/ship'
require './lib/computer'

class Game

  def initialize
    @player_one = Player.new
    @computer = Computer.new
  end

  def computer_fire
    choice = @computer.fire_coordinates.sample

    @player_one.player_board.cells[choice].fire_upon
    @computer.fire_coordinates.delete(choice)
  end

  def player_fire(coordinate)
    if @computer.computer_board.valid_coordinate(coordinate) && @computer.computer_board.cells[coordinate].fired_upon? == false
      @computer.computer_board.cells[coordinate].fire_upon
      true
    else
      puts 'Sorry, that coordinate does not exist, or has already been fired upon, please enter another'
      false
    end
  end


  def new_game
    @player_one = Player.new
    @computer = Computer.new
  end

  def computer_places_ships
    @computer.create_horizontal_cruiser_coordinates
    @computer.create_vertical_cruiser_coordinates
    @computer.create_horizontal_sub_coordinates
    @computer.create_vertical_sub_coordinates
    @computer.place_cruiser
    @computer.place_sub
  end

  def main_menu
    puts "Welcome to....!@!@ Battleship @!@! \n
       Enter p to play. Enter q to quit."

  selection = gets.chomp.upcase

    if selection == "P"
      ship_placement
    elsif selection == "Q"
      puts   'Farewell'
    else
      puts "That's an invalid selection, please try again."
      selection = gets.chomp
      main_menu
    end
  end

  def ship_placement
    puts   "Greetings hero! It appears you woke up on the wrong side of the deck today!\n
        Alas, we have no time to talk! The Dread Pirate Rob.... I'm sorry, Roald\n
        has ammassed their ships in the waters over yonder. We have but two in our fleet,\n
        and they are yours to command! First is our cruiser! Coming in at three coordinates long\n
        it'll serve ya well! Now, where shall we put it?! I'll need three coordinates, and you can see the board below\n
         a combination of a letter and a number from A1 to D4,\n
          and they'll need to be consecutive whether horizontally\n
        (A1, A2, A3) or vertically (A1, B1, C1). Captain, where to?!"

    puts @player_one.player_board.render

    until @player_one.place_cruiser(gets.chomp.split)
        loop
    end

    puts 'Your cruiser has been set'
    puts @player_one.player_board.render(true)

    puts "Now lets place our sub! Same rules as before,\n
    but this time we only need two coordinates, and they can't overlap with the cruiser!"

    until @player_one.place_sub(gets.chomp.split)
      loop
    end

    puts 'Capital idea! I was thinking of placing it there myself!'
    puts @player_one.player_board.render(true)

    puts 'CAPTAIN! It seems Roald has moved their ships into position, get ready to attack!'
    computer_places_ships
    game_flow
  end

def game_flow
  puts "It's time to really give them what fore! Select a single coordinate to fire on, and remeber, try not to repeat coordiantes!"

  until @computer.computer_cruiser.health == 0 && @computer.computer_sub.health == 0 || @player_one.player_cruiser.health == 0 && @player_one.player_sub.health == 0
    puts "******* Roald's Board *******"
    puts @computer.computer_board.render
    puts "\n ******* Your Board *******"
    puts @player_one.player_board.render
    puts 'Now where shall attack next?!'
      until player_fire(gets.chomp)
        loop
      end
      puts 'The enemy fired back!'
      computer_fire
      end

  game_over
end

def game_over
    if @computer.computer_cruiser.health == 0 && @computer.computer_sub.health == 0
      puts 'We got Roald! Congratulations captain!'
    elsif @player_one.player_cruiser.health == 0 && @player_one.player_sub.health == 0
      puts 'They got us this time cap, but I know we can get them next time'
    end

  puts 'Play again? Y for yes and N for no.'

  selection = gets.chomp.upcase

    if selection == 'Y'
      new_game
      ship_placement
    elsif selection == 'N'
      puts 'Farewell'
    else selection != 'Y' && selection != 'N'
      puts "Again that's Y for yes and N for no"
    end
  end
end
