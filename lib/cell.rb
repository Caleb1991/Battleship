class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
    @has_been_hit = false
  end

  def empty?
    @ship == nil

  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @has_been_hit
  end

  def fire_upon
    ship.hit
    @has_been_hit = true

    # fired_upon? = true
  end

def render(ships = false)

end
end 
