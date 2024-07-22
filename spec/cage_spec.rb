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
      expect(cage.add_coin(2, 'R')[0][2]).to eq('R') 
    end
  end

  cage.cage[0] = ['_', '_', 'R', 'R', 'R', 'R', '_']
  context "when there are 4 in a row" do
    expect(cage.game_over?).to eq(true)
  end
end