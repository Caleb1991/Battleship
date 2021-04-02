require './lib/cell'
require './lib/ship'

class Board
  attr_reader :cells

  def initialize
    @cells = {}
    let = "A".."D"
    num = "1".."4"
    let.each do |letter|
      num.each do |number|
        cells[letter + number] =  Cell.new(letter + number)
      end
    end
  end


  def valid_coordinate(coordinate)
    if @cells.key?(coordinate)
      true
    else
      false
    end
  end
  # if you use an else there will always be a return value, an elsif has the possibility to not have one -Tony 2021


  def valid_coordinates?(ship, coordinates)
    split_coordinates = []
    coordinate_values = []

    coordinates.each do |coordinate|
      split_coordinates << coordinate.split("")
      letter = split_coordinates[0][0].ord
      number = split_coordinates[0][1].to_i
      coordinate_values << letter + number
      split_coordinates.shift
    end

    if coordinate_values.each_cons(ship.length) do |set| set == ???
      true
    else
      false
    end
    #if coordinates.each_cons(ship.length) do |coordinate| coordinate == coordinates end #iterate through the array, for every given value, split them, call .ord on the letters (first value) then add them together
      # Take the value I'm given, call each cons on that Will need to turn the number of the string .to_i
      #think about how you can solve it in real life
      #coordinates.each do |given_coordinate| valid_coordinate(given_coordinate) will need to include this as a check
  end

  #tests if the given ship can be entered into the given coordinates
  #will reference the ships length, whether the coordinates are an acceptable range
  #will need to look out for no diagonals, no skipping (A1, A2, A4)
  #returns boolean value


  def place(ship, coordinates)
    #will use valid_coordinates in here
    #if valid coordinates == true && no ship already (possibly method that turns valid coordinate to false)
    # place ship at coordinates
  end
end



  # valid_placement CEO method that tells others to go do work and I'll make determinations
  # every method deserves a test
  #try and place ships by next checkin (paticular combination that will error)
  # some validation tools in iteration 2
  # rendering board 'spend way too much time testing render method', so get fresh set of eyes
  #reach out to Megan and she will give fresh set of eyes to render board
  #starting loop how do I get out 'all ships are sunk? == true'
  # all ships sunk as a method that returns sunk? ==true for all ships
  #will end up with more classes than outlined 'iteration three' player class (that has player or computer)
  # or player and computer class
  #think about how many of each thing do you need when heading into iteration 3
