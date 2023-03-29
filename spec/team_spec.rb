require 'rspec'
require './lib/player'
require './lib/team'

RSpec.describe Team do
  before(:each) do
    @team = Team.new("Dodgers", "Los Angeles")
    @player_1 = Player.new("Michael Palledorous" , 1000000, 36)
    @player_2 = Player.new("Kenny DeNunez", 500000, 24)
    @player_3 = Player.new("Alan McClennan", 750000, 48)
    @player_4 = Player.new("Hamilton Porter", 100000, 12)
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@team).to be_a Team
    end

    it 'has attributes' do 
      expect(@team.name).to eq('Dodgers')
      expect(@team.city).to eq('Los Angeles')
    end
    
    it 'begins with an empty roster' do 
      expect(@team.roster).to eq([])
    end
  end

  describe '#player_count' do 
    it 'begins with 0 players' do 
      expect(@team.player_count).to eq(0)
    end

    xit 'increases player count with added players' do 
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      expect(@team.player_count).to eq(2)
    end
  end

  describe '#add_player' do 
    xit 'adds players to roster' do 
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      expect(@team.roster).to eq([@player_1, @player_2])
    end
  end
end
