require './lib/board'
require './lib/cell'
require './lib/player'
require './lib/ship'

RSpec.describe Player do

  it 'exists' do
    player = Player.new

    expect(player).to be_an_instance_of(Player)
  end
end
