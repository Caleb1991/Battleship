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

  def all_same?(letters_or_numbers)
    letters_or_numbers.each_cons(2).all? { |one, two| one == two }
  end

  def sequential?(letters_or_numbers)
    letters_or_numbers.each_cons(2).all? { |one, two| one == two - 1 }
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

  def ship_place_helper(ship, coordinates)
    coordinates.each do |coordinate| (@cells[coordinate]).place_ship(ship)
    end
  end

  def place(ship, coordinates)

    if valid_placement?(ship, coordinates) && tests_empty(coordinates)
      ship_place_helper(ship, coordinates)
      return true
    else
      return false
    end
  end

  def render

    test = [@cells.values]
    test.map do |cell| cell.render
    end
#will be calling on the value for each cell.render
  end
end
