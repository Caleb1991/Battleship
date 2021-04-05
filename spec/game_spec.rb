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
end
