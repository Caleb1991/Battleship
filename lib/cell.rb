class Cell
  attr_reader :coordinate, :ship, :occupied

  def initialize(coordinate)
    @coordinate = coordinate
    @occupied = false
    @ship = nil
    @has_been_hit = false
  end

  def empty?
    @occupied == false
  end

  def place_ship(ship)
    @occupied = true
    @ship = ship
  end

  def fired_upon?
    @has_been_hit
  end

  def fire_upon
    if @ship != nil
      ship.hit
    end
    @has_been_hit = true
  end

  def render(ships = false)
    if fired_upon? == false && @occupied == false
      "."
    elsif fired_upon? == false && @occupied == true && ships == false
      "."
    elsif ships == true && @occupied == true && fired_upon? != true
      "S"
    elsif fired_upon? == true && @occupied == false
      "M"
    elsif ship.health == 0
      "X"
    elsif fired_upon? == true && @occupied == true
      # look at the possibilities for if a ship is there and if one isn't
      "H"
    end
  end
end
