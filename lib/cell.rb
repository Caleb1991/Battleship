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
    ship.hit
    @has_been_hit = true
  end

  def render(ships = false)
    if fired_upon? == false
      "."
    elsif ships == true && @occupied == true
      "S"  
    elsif fired_upon? == true && @occupied == false
      "M"
    elsif fired_upon? == true && @occupied == true
      "H"
    else ship.health == 0
      "X"
    end
  end
end
