require './lib/ship'
require './lib/cell'
require './lib/board'

RSpec.describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_an_instance_of(Board)
  end

  xit 'has cells' do
    board = Board.new


    expect(board["D4"]).to eq()
  end

  it 'tells if coordinate exists' do
    board = Board.new

    expect(board.valid_coordinate("B4")).to eq(true)
  end

  it 'tells when a coordinate doesnt exist' do
    board = Board.new

    expect(board.valid_coordinate("Z33")).to eq(false)
  end
end
