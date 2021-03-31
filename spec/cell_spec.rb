require './lib/ship'
require './lib/cell'
require 'pry'


# pry(main)> require './lib/ship'
# # => true
#
# pry(main)> require './lib/cell'
# # => true
#
# pry(main)> cell = Cell.new("B4")
# # => #<Cell:0x00007f84f0ad4720...>
#
# pry(main)> cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0891238...>
#
# pry(main)> cell.place_ship(cruiser)
#
# pry(main)> cell.fired_upon?
# # => false
#
# pry(main)> cell.fire_upon
#
# pry(main)> cell.ship.health
# # => 2
#
# pry(main)> cell.fired_upon?
# # => true
# Finally, a Cell will have a method called render which returns a String representation of the Cell for when we need to print the board. A cell can potentially be rendered as:
#
# ”.” if the cell has not been fired upon.
# “M” if the cell has been fired upon and it does not contain a ship (the shot was a miss).
# “H” if the cell has been fired upon and it contains a ship (the shot was a hit).
# “X” if the cell has been fired upon and its ship has been sunk.
# Additionally, we will include an optional boolean argument to indicate if we want to reveal a ship in the cell even if it has not been fired upon. This should render a cell that has not been fired upon and contains a ship as an “S”. This will be useful for showing the user where they placed their ships and for debugging.
#
# pry(main)> cell_1 = Cell.new("B4")
# # => #<Cell:0x00007f84f11df920...>
#
# pry(main)> cell_1.render
# # => "."
#
# pry(main)> cell_1.fire_upon
#
# pry(main)> cell_1.render
# # => "M"
#
# pry(main)> cell_2 = Cell.new("C3")
# # => #<Cell:0x00007f84f0b29d10...>
#
# pry(main)> cruiser = Ship.new("Cruiser", 3)
# # => #<Ship:0x00007f84f0ad4fb8...>
#
# pry(main)> cell_2.place_ship(cruiser)
#
# pry(main)> cell_2.render
# # => "."
#
# # Indicate that we want to show a ship with the optional argument
# pry(main)> cell_2.render(true)
# # => "S"
#
# pry(main)> cell_2.fire_upon
#
# pry(main)> cell_2.render
# # => "H"
#
# pry(main)> cruiser.sunk?
# # => false
#
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.hit
#
# pry(main)> cruiser.sunk?
# # => true
#
# pry(main)> cell_2.render
# # => "X"

RSpec.describe Cell do

  it 'is an instance' do
    cell = Cell.new("B4")
  expect(cell).to be_an_instance_of(Cell)
  end

  xit 'has a coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  xit 'is empty' do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  it 'interaction pattern' do
    # pry(main)> cell.ship
    # # => nil
    cell = Cell.new("B4")

    expect(cell.ship).to eq(nil)
    # pry(main)> cell.empty?
    # # => true

    expect(cell.empty?).to eq(true)
    # pry(main)> cell.place_ship(cruiser)
    #
    # pry(main)> cell.ship
    # # => #<Ship:0x00007f84f0891238...>
    #

    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be_an_instance_of(Ship)
    # pry(main)> cell.empty?
    # # => false
    expect(cell.empty?).to eq(false)

    # Addxitionally, a cell knows when it has been fired upon. When it is fired upon, the cell’s ship should be damaged if it has one:




  end


  xit 'places a ship' do
    c
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be_an_instance_of(Ship)
  end

  xit 'it occupies a cell' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.empty?).to eq(false)
  end

  xit 'tells when not fired upon' do
    cruiser = Ship.new("Cruiser", 3)
    cell = Cell.new("B4")
    cell.place_ship(cruiser)


    expect(cell.fired_upon?).to eq(false)
  end

  it 'fires upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.ship.health).to eq(2)
  end

  it 'tells when fired upon' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.fired_upon?).to eq(true)
  end
end
