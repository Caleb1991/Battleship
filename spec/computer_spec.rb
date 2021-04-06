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

  it 'creates horizontal cruiser coordiantes' do
    computer = Computer.new

    computer.create_horizontal_cruiser_coordinates

    expected = [["A1", "A2", "A3"],
                ["A2", "A3", "A4"],
                ["A3", "A4", "B1"],
                ["A4", "B1", "B2"],
                ["B1", "B2", "B3"],
                ["B2", "B3", "B4"],
                ["B3", "B4", "C1"],
                ["B4", "C1", "C2"],
                ["C1", "C2", "C3"],
                ["C2", "C3", "C4"],
                ["C3", "C4", "D1"],
                ["C4", "D1", "D2"],
                ["D1", "D2", "D3"],
                ["D2", "D3", "D4"]]

    expect(computer.cruiser_ship_coordinates).to eq(expected)
  end

  it 'creates vertical cruiser coordiantes' do
    computer = Computer.new

    computer.create_vertical_cruiser_coordinates

    expected = [["A1", "B1", "C1"],
                ["B1", "C1", "D1"],
                ["C1", "D1", "B2"],
                ["D1", "B2", "C2"],
                ["B2", "C2", "D2"],
                ["C2", "D2", "A2"],
                ["D2", "A2", "C3"],
                ["A2", "C3", "B3"],
                ["C3", "B3", "D3"],
                ["B3", "D3", "A3"],
                ["D3", "A3", "D4"],
                ["A3", "D4", "B4"],
                ["D4", "B4", "A4"],
                ["B4", "A4", "C4"]]

    expect(computer.cruiser_ship_coordinates).to eq(expected)
  end

  it 'creates horizontal sub coordinates' do
    computer = Computer.new

    computer.create_horizontal_sub_coordinates

    expected = [["A1", "A2"],
                ["A2", "A3"],
                ["A3", "A4"],
                ["A4", "B1"],
                ["B1", "B2"],
                ["B2", "B3"],
                ["B3", "B4"],
                ["B4", "C1"],
                ["C1", "C2"],
                ["C2", "C3"],
                ["C3", "C4"],
                ["C4", "D1"],
                ["D1", "D2"],
                ["D2", "D3"],
                ["D3", "D4"]]

    expect(computer.sub_ship_coordinates).to eq(expected)
  end

  it 'creates vertical sub coordinates' do
    computer = Computer.new

    computer.create_vertical_sub_coordinates

    expected = [["A1", "B1"],
                ["B1", "C1"],
                ["C1", "D1"],
                ["D1", "B2"],
                ["B2", "C2"],
                ["C2", "D2"],
                ["D2", "A2"],
                ["A2", "C3"],
                ["C3", "B3"],
                ["B3", "D3"],
                ["D3", "A3"],
                ["A3", "D4"],
                ["D4", "B4"],
                ["B4", "A4"],
                ["A4", "C4"]]

    expect(computer.sub_ship_coordinates).to eq(expected)
  end
end
