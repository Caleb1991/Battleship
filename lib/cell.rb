class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    @ship == nil

  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?

    fired_upon? = false

  end

  def fire_upon
    @ship != nil
    ship.hit

    # fired_upon? = true
  end

def render(ships = false)
#returns string representation of teh
end
  # def fired_upon?
  #
  # Do we need a variable to define
end
