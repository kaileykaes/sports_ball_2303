class Team
  attr_reader :name, 
              :city, 
              :roster
  
  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
  end

  def player_count
    roster.length
  end

  def add_player(player)
    @roster << player
  end

  def long_term_players
    roster.find_all do |player|
      player.contract_length > 24 
    end
  end

  def short_term_players
    roster.find_all do |player|
      player.contract_length <= 24 
    end
  end

  def total_value
    cost = 0
    roster.map do |player|
      cost += player.total_cost
    end
    cost
  end

  def details
    team_details = Hash.new
    team_details['total_value'] = total_value
    team_details['player_count'] = player_count
    team_details
  end

  def average_cost_of_player
    "$#{total_value / player_count}".insert(-4, ',').insert(-8, ',')
  end
end