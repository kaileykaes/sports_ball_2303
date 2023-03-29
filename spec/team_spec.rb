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

    it 'increases player count with added players' do 
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      expect(@team.player_count).to eq(2)
    end
  end

  describe '#add_player' do 
    it 'adds players to roster' do 
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      expect(@team.roster).to eq([@player_1, @player_2])
    end
  end

  describe 'player terms' do 
    it '#long_term_players' do 
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)
      expect(@team.long_term_players).to eq([@player_1, @player_3])
    end
    
    it '#long_term_players' do 
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)
      expect(@team.long_term_players).to eq([@player_2, @player_4])
    end
  end

  describe '#total_value' do 
    it 'calculates total cost of players' do 
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)
      expect(@team.total_value).to eq(85200000)
    end
  end

  describe '#details' do 
    it 'creates a hash of team details' do 
      @team.add_player(@player_1)
      @team.add_player(@player_2)
      @team.add_player(@player_3)
      @team.add_player(@player_4)
      expect(@team.details).to eq({
        "total_value" => 85200000, 
        "player_count" => 4
      })
    end
  end
end
