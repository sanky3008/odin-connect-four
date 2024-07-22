require './lib/Cage.rb'

describe Cage do
  subject(:cage){ Cage.new }

  context "when a Cage is initialised" do
    it "should have the correct default cage" do
      expect(cage.cage).to eq(Array.new(6){Array.new(7, '_')})
    end
  end

  context "when a coin is added" do
    it "should put it at the correct place" do
      expect(cage.add_coin(2, 'R')[5][2]).to eq('R')
    end
  end

  let(:mock_cage) do
    mock_cage = Cage.new
    mock_cage.add_coin(3, 'B')
    mock_cage.add_coin(4, 'B')
    mock_cage.add_coin(4, 'B')
    mock_cage.add_coin(5, 'B')
    mock_cage.add_coin(5, 'B')
    mock_cage.add_coin(5, 'B')

    mock_cage.add_coin(2, 'R')
    mock_cage.add_coin(3, 'R')
    mock_cage.add_coin(4, 'R')
    mock_cage.add_coin(5, 'R')
    puts mock_cage
    mock_cage
  end

  context "when there are 4 in a row" do
    it "should return R" do
      expect(mock_cage.game_over?).to eq('R')
    end
  end
end
