require 'pg'

class Spaces
  attr_reader :name, :description, :price, :fromdate, :todate

  def initialize(space)
    @name = space['name']
    @description = space['description']
    @price = space['price']
    @fromdate = space['fromdate']
    @todate = space['todate']
  end 
 
  
  def self.all 
    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map do |space|
      Spaces.new(space)
    end
 end 
end