require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_an_instance_of(Board)
  end

  it 'has cell class as values' do
    board = Board.new

    expect(board.cells["A1"]).to be_an_instance_of(Cell)
    expect(board.cells["D4"]).to be_an_instance_of(Cell)
  end

  it 'tells if coordinate exists' do
    board = Board.new

    expect(board.valid_coordinate("B4")).to eq(true)
  end

  it 'tells when a coordinate doesnt exist' do
    board = Board.new

    expect(board.valid_coordinate("Z33")).to eq(false)
  end

  it 'returns true when given the correct numvber of coordinates' do
    board = Board.new
    ship = Ship.new("Crusier", 3)

    expect(board.valid_placement?(ship, ["A1", "A2", "A3"])).to eq(true)
  end

  it 'returns false when given the incorrect number of coordinates' do
    board = Board.new
    ship = Ship.new("Crusier", 3)

    expect(board.valid_placement?(ship, ["A1", "A2"])).to eq(false)
  end

  it 'valid coordinate returns true' do
    board = Board.new
    ship = Ship.new("Crusier", 3)

    expect(board.valid_placement?(ship, ["A1", "A2", "A3"])).to eq (true)
  end

  it 'valid coordinates returns false' do
    board = Board.new
    ship = Ship.new("Crusier", 3)

    expect(board.valid_placement?(ship, ["A1", "A2", "A3"])).to eq (true)
  end

  it 'checks if cell is empty' do
    board = Board.new
    ship = Ship.new("Crusier", 3)

    expect(board.valid_placement?(ship, ["A1", "A2", "A3"])).to eq(true)
  end

  it 'tests if cell is empty' do
    board = Board.new

    expect(board.tests_empty(["A1", "A2", "A3"])).to eq(true)
  end

  it 'knows when cell is occupied' do
    board = Board.new
    ship = Ship.new("Crusier", 3)
    destroyer = Ship.new("Destroyer", 3)

    board.place(ship, ["A1", "A2", "A3"])

    expect(board.tests_empty(["A1", "A2", "A3"])).to eq(false)
  end

  it 'tests for same numbers and sequential letters' do
    board = Board.new
    ship = Ship.new("Crusier", 3)

    expect(board.valid_placement?(ship, ["A1", "A2", "A3"])).to eq(true)
  end

  it 'places a ship' do
    board = Board.new
    cruiser = Ship.new("Crusier", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    expect(cell_1.ship).to eq(cruiser)
    expect(cell_2.ship).to eq(cruiser)
    expect(cell_3.ship).to eq(cruiser)
  end

  it 'returns false for occupied coordiates' do
    board = Board.new
    cruiser = Ship.new("Crusier", 3)
    destroyer = Ship.new("Destroyer", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    expect(board.place(destroyer, ["A1", "A2", "A3"])).to eq(false)
  end

  it 'renders a board' do
    board = Board.new

    render = " 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"

    expect(board.render).to eq(render)
  end
end
