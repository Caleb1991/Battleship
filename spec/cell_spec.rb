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

  it 'tells when not fired upon' do
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

  it 'shows a .' do
    cell = Cell.new("B4")

    expect(cell.render).to eq(".")
  end

  it 'shows a S' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)

    expect(cell.render(true)).to eq("S")
  end

  it 'shows a M' do
    cell = Cell.new("B4")
    cell.fire_upon

    expect(cell.render).to eq("M")
  end

  it 'shows a H' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon

    expect(cell.render).to eq("H")
  end

  it 'shows a X' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    cell.fire_upon
    cell.fire_upon
    cell.fire_upon

    expect(cell.render).to eq("X")
  end
end
