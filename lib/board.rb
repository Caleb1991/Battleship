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

    def ship_length_match?(ship, coordinates)
      if ship.length == coordinates.length
       true
      else
       false
      end
    end

    def coordinates_exist?(coordinates)
      coordinates.all? do |coordinate|
      valid_coordinate(coordinate) == true
      end
    end

  def valid_placement?(ship, coordinates)
    numbers = []
    letters = []

    coordinates.each do |coordinate|
      letters << coordinate.chars.first.ord
      numbers << coordinate.chars.last.to_i
    end

    if ship_length_match?(ship, coordinates) && coordinates_exist?(coordinates) && tests_empty(coordinates) && all_same?(numbers) && sequential?(letters)
     return true
    elsif ship_length_match?(ship, coordinates) && coordinates_exist?(coordinates) && tests_empty(coordinates) && all_same?(letters) && sequential?(numbers)
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
    if valid_placement?(ship, coordinates)
      ship_place_helper(ship, coordinates)
      return true
    else
      return false
    end
  end

  def render(ships = false)
    cell_values = []
   "  1 2 3 4 \n" +
   "A #{@cells.values[0].render(ships)} #{@cells.values[1].render(ships)} #{@cells.values[2].render(ships)} #{@cells.values[3].render(ships)} \n" +
   "B #{@cells.values[4].render(ships)} #{@cells.values[5].render(ships)} #{@cells.values[6].render(ships)} #{@cells.values[7].render(ships)} \n" +
   "C #{@cells.values[8].render(ships)} #{@cells.values[9].render(ships)} #{@cells.values[10].render(ships)} #{@cells.values[11].render(ships)} \n" +
   "D #{@cells.values[12].render(ships)} #{@cells.values[13].render(ships)} #{@cells.values[14].render(ships)} #{@cells.values[15].render(ships)} \n"
  end
end
