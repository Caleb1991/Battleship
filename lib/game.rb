class Game
  attr_reader :player_one,
              :computer

  def initialize
    @player_one = Player.new
    @computer = Computer.new
  end

  def computer_fire
    choice = @computer.fire_coordinates.sample

    @player_one.player_board.cells[choice].fire_upon
    if @player_one.player_board.cells[choice].render == 'M'
      puts "The enemy fired back at #{choice}! They missed!"
    elsif @player_one.player_board.cells[choice].render == 'H'
      puts "The enemy fired back at #{choice}! It was a clean hit captain!"
    elsif @player_one.player_board.cells[choice].render == 'X'
      puts "The enemy fired back at #{choice}! One of our ships have been sunk captain!"
    end
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

  def player_shot_feedback(coordinate)
    if @computer.computer_board.cells[coordinate].render == 'M'
      puts "Our shot at #{coordinate} missed captain!"
    elsif @computer.computer_board.cells[coordinate].render == 'H'
      puts "Our shot at #{coordinate} connected! Capital hit captain!"
    elsif @computer.computer_board.cells[coordinate].render == 'X'
      puts "Our shot at #{coordinate} has sunk one of their ships!"
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
    puts "Welcome to....\n
    !@!@ Battleship @!@! \n
    Enter p to play. Enter q to quit."

  selection = gets.chomp.upcase
    until selection == 'P' || selection == 'Q'

      if selection != 'P' || selection != 'Q'
        puts "That's an invalid selection, please press p to play, or q to quit."
        selection = gets.chomp.upcase
        loop
      end
    end

    if selection == "P"
      ship_placement
    else selection == "Q"
      puts   'Farewell'
    end
  end

  def ship_placement
    puts"\n    Greetings hero! It appears you woke up on the wrong side of the deck today!\n
    Alas, we have no time to talk! The Dread Pirate Rob.... I'm sorry, Roald\n
    has ammassed their ships in the waters over yonder. We have but two in our fleet,\n
    and they are yours to command! First is our cruiser! Coming in at three coordinates\n
    long it'll serve ya well! Now, where shall we put it?! I'll need three coordinates,\n
    and you can see the board below a combination of a letter and a number from A1 to D4,\n
    and they'll need to be consecutive whether horizontally: A1 A2 A3\n
    or vertically: A1 B1 C1. Captain, where to?!\n"

    puts @player_one.player_board.render

    until @player_one.place_cruiser(gets.chomp.split)
        loop
    end

    puts 'Your cruiser has been set'
    puts @player_one.player_board.render(true)

    puts "    Now lets place our sub! Same rules as before,
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
    puts "\n******* Your Board *******"
    puts @player_one.player_board.render
    puts 'Now where shall attack next?!'
      until player_fire(shot = gets.chomp)
        loop
      end
      player_shot_feedback(shot)
      computer_fire
      end

  game_over
end

def game_over
    if @computer.computer_cruiser.health == 0 && @computer.computer_sub.health == 0
      puts 'We got Roald! Congratulations captain, you win!'
      puts "******* Roald's Board *******"
      puts @computer.computer_board.render
      sleep(4)
    elsif @player_one.player_cruiser.health == 0 && @player_one.player_sub.health == 0
      puts 'They got us this time cap, we lost, but I know we can get them next time'
      puts "\n******* Your Board *******"
      puts @player_one.player_board.render
      sleep(4)
    end

  puts 'Play again? Y for yes and N for no.'

  selection = gets.chomp.upcase

    until selection == 'Y' || selection == 'N'
      if selection != 'Y' && selection != 'N'
        puts "Again that's Y for yes and N for no"
      end

      selection = gets.chomp.upcase
      loop
    end

    if selection == 'Y'
      new_game
      main_menu
    elsif selection == 'N'
      puts 'Farewell'
    end
  end
end
