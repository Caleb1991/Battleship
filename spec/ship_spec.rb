require './lib/ship'

RSpec.describe Ship do

  it 'creates an instance' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser).to be_an_instance_of(Ship)
  end

  it 'it has a name' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.name).to eq("Cruiser")
  end

  it "has a length" do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.length).to eq(3)
  end

  it 'has health' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.health).to eq(3)
  end

  it 'tests if sunk' do
    cruiser = Ship.new("Cruiser", 3)

    expect(cruiser.sunk?).to eq(false)
  end

  it 'reduces ship health by one' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit

    expect(cruiser.health).to eq(2)
  end

  it 'is sunk' do
    cruiser = Ship.new("Cruiser", 3)

    cruiser.hit
    cruiser.hit
    cruiser.hit

    expect(cruiser.sunk?).to eq(true)
  end
end
