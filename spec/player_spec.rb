require '.lib/Player.rb'

describe Player do
  subject(:p){ Player.new('R') }

  context "when called" do
    it "initialises the coin correclty" do
      expect(p.coin).to eq('R')
    end
  end
end