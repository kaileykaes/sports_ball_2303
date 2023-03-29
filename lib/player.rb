class Player
  attr_reader :name, 
              :monthly_cost, 
              :contract_length
  
  def initialize(name, monthly_cost, contract_length)
    @name = name
    @monthly_cost
    @contract_length
  end

  def first_name
    name.split(' ').first
  end
end