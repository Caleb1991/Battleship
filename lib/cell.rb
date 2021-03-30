class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end

  def empty?
    @ship == nil
    #@no_attacks = .
    #if ship == nil, then fire_upon changes no_attacks to false and empty to Miss
    #if ship != nil, then fire_upon changes no_attacsk to false and ship.hit is triggered
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?

  end

  def fire_upon
    ship.hit
  end

def render(ships = false)
#returns string representation of teh
end
  # def fired_upon?
  #
  # Do we need a variable to define
end
