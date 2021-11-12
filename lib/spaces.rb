require 'pg'

class Spaces
  attr_reader :id, :name, :description, :price, :fromdate, :todate

  def initialize(space)
    @id = space['id']
    @name = space['name']
    @description = space['description']
    @price = space['price']
    @fromdate = space['fromdate']
    @todate = space['todate']
  end 
 
  
  def self.all 
    if ENV["ENVIRONMENT"] == 'test' 
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end 
    result = DatabaseConnection.query('SELECT * FROM spaces;')
    result.map do |space|
      Spaces.new(space)
    end
  end 

  def self.add(name:, description:, price:, from_date:, to_date:)
    if ENV["ENVIRONMENT"] == 'test' 
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end 
    connection.exec("INSERT INTO spaces (name, description, price, fromdate, todate) VALUES( '#{name}', '#{description}', '#{price}', '#{from_date}', '#{to_date}') ; ")
  end
 
end