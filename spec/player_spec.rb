require './lib/board'
require './lib/cell'
require './lib/player'
require './lib/ship'
require './lib/computer'

RSpec.describe Player do

  it 'exists' do
    player = Player.new

    expect(player).to be_an_instance_of(Player)
  end

  it 'has a board' do
    player = Player.new

    expect(player.player_board).to be_an_instance_of(Board)
  end

  it 'has a cruiser' do
    player = Player.new

    expect(player.player_cruiser.length).to eq(3)
  end

  it 'has a sub' do
    player = Player.new

    expect(player.player_sub.length).to eq(2)
  end

  it 'can place cruiser' do
    player = Player.new

    expect(player.place_cruiser(['A1', 'A2', 'A3'])).to eq(true)
  end

  it 'can place sub' do
    player = Player.new

    expect(player.place_sub(['A1', 'A2'])).to eq(true)
  end

  it 'fires on computer board' do
    player = Player.new
    computer = Computer.new
    require 'pry';binding.pry
    player.fire('A1')

    expect(computer.computer_board.cells['A1'].fired_upon?).to eq(true)
  end
end
