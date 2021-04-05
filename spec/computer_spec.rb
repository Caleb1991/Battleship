require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/computer'

RSpec.describe Computer do

  it 'exists' do
    computer = Computer.new

    expect(computer).to be_an_instance_of(Computer)
  end

  it 'has a name' do
    computer = Computer.new

    expect(computer.name).to eq('Roald')
  end

  it 'has a cruiser' do
    computer = Computer.new

    expect(computer.computer_cruiser).to be_an_instance_of(Ship)
  end

  it 'has a sub' do
    computer = Computer.new

    expect(computer.computer_sub).to be_an_instance_of(Ship)
  end

  it 'has fire coordinates' do
    computer = Computer.new

    expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]

    expect(computer.fire_coordinates).to eq(expected)
  end

  it 'fires'do
    computer = Computer.new
    current_coordiantes = computer.fire_coordinates.length

    computer.fire

    expect(current_coordiantes).to eq(computer.fire_coordinates.length + 1)
  end
end
