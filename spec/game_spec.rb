require './lib/board'
require './lib/cell'
require './lib/computer'
require './lib/game'
require './lib/player'
require './lib/ship'

RSpec.describe Game do

  it 'exists' do
    game = Game.new

    expect(game).to be_an_instance_of(Game)
  end

  it 'has a computer' do
    game = Game.new

    expect(game.computer).to be_an_instance_of(Computer)
  end

  it 'has a player' do
    game = Game.new

    expect(game.player_one).to be_an_instance_of(Player)
  end

  it 'has a computer that fires' do
    game = Game.new

    expected = game.computer.fire_coordinates.length

    game.computer_fire

    expect(game.computer.fire_coordinates.length).to eq(expected - 1)
  end

  it 'has a player that can fire' do
    game = Game.new

    expect(game.player_fire('A1')).to eq(true)
  end
end
