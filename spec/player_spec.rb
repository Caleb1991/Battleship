require './lib/board'
require './lib/cell'
require './lib/player'
require './lib/ship'

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

  it 'can place ships' do
    player = Player.new

    player.set_cruiser
    player.set_sub

    expect(player.player_cruiser.).to eq()
    expect(player.player_sub.).to eq()
  end

  it 'can fire upon' do
    player = Player.new

    player.fire
  end
end
