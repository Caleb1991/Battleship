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

  def all_same?(array_value)
    array_value.each_cons(2).all? { |one, two| one == two }
  end

  def sequential?(array_value)
    array_value.each_cons(2).all? { |one, two| one == two - 1 }
  end

  def tests_empty(coordinates)
    coordinates.all? do |coordinate|
        @cells[coordinate].empty?
      end
    end

  def valid_placement?(ship, coordinates)
    numbers = []
    letters = []

    if ship.length != coordinates.length
      return false
    else
      return true
    end

    coordinates.each do |coordinate|
    if valid_coordinate(coordinate) == true
      return true
    else
      return false
    end
    end

    coordinates.each do |coordinate|
      letters << coordinate.slice!(0).ord
      numbers << coordinate.to_i
    end

    if all_same?(numbers) && sequential?(letters)
      return true
    elsif all_same?(letters) && sequential?(numbers)
      return true
    else
      return false
    end
  end

  # def check_empty(this)
  #   this.each.all? do |coordinate| @cells[coordinate].empty? == true end
  # end

  def ship_place_helper(ship, other)
    other.each do |coordinate| (@cells[coordinate]).place_ship(ship)
    end
  end

  def place(ship, array)

    if valid_placement?(ship, array) && tests_empty(array)
      ship_place_helper(ship, array)
      return true
    else
      return false
  end
end
end
    #will be using each_cons and going through A..Z and 1..26 adding them together and seeing if the coordinate_values occurs in them
    #
    # if coordinate_values.each_cons(ship.length) do |set| set == ???
    #   true
    # else
    #   false
    #end
    #if coordinates.each_cons(ship.length) do |coordinate| coordinate == coordinates end #iterate through the array, for every given value, split them, call .ord on the letters (first value) then add them together
      # Take the value I'm given, call each cons on that
      #think about how you can solve it in real life
      #coordinates.each do |given_coordinate| valid_coordinate(given_coordinate) will need to include this as a check


  #tests if the given ship can be entered into the given coordinates
  #will reference the ships length, whether the coordinates are an acceptable range
  #will need to look out for no diagonals, no skipping (A1, A2, A4)
  #returns boolean value



    #will use valid_coordinates in here
    #if valid coordinates == true && no ship already (possibly method that turns valid coordinate to false)
    # place ship at coordinates






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
