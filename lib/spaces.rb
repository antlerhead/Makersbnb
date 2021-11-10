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

  def self.add(name:, description:, price:, from_date:, to_date:)
    connection = PG.connect(dbname: 'makersbnb_test')
    p '+++++'
    p 'in the add method'
    connection.exec("INSERT INTO spaces (name, description, price, fromdate, todate) VALUES( '#{name}', '#{description}', '#{price}', '#{from_date}', '#{to_date}') ; ")
  end
 
end