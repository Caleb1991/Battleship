require './lib/ship'
require './lib/cell'

RSpec.describe Cell do

  it 'is an instance' do
    cell = Cell.new("B4")

  expect(cell).to be_an_instance_of(Cell)
  end

  it 'has a coordinate' do
    cell = Cell.new("B4")

    expect(cell.coordinate).to eq("B4")
  end

  it 'is empty' do
    cell = Cell.new("B4")

    expect(cell.empty?).to eq(true)
  end

  it 'places a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.ship).to be_an_instance_of(Ship)
  end

  it 'it occupies a cell' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.empty?).to eq(false)
  end
end
