require './lib/Game.rb'
require './lib/Player.rb'
require './lib/Cage.rb'

describe Game do
  subject(:game){ Game.new() }

  context "when a new game is called" do
    it "initalises player 1 correctly" do
      expect(game.p1.coin).to eq('R').or eq('B')
    end

    it "initialises player 2 correctly" do
      expect(game.p2.coin).to eq('B').or eq('R')
    end

    it "initalises cage correctly" do
      expect(game.cage.cage).to eq(Array.new(6){Array.new(7, '_')})
    end
  end
end
