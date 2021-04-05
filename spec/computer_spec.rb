require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'

RSpec.describe Computer do

  it 'exists' do
    computer = Computer.new

    expect(computer).to be_an_instance_of(Computer)
  end
end
