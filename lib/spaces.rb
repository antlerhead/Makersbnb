require 'pg'

class Spaces

  def initialize(name:)
    @name = name
  end 


  def self.all 
     result = DatabaseConnection.query('SELECT * FROM spaces;')
     
     result.map do |space|
        Spaces.new(name: space['name'],description: space['description'],price: space['price'],fromdate: space['fromdate'],todate: space['todate'],booking_id: space['booking_id'],host: space['host'])
    end
 end 
end