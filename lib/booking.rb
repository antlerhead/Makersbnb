require 'pg'

class Booking
  attr_reader :space_id, :booked_date, :resident, :requested, :confirmed

  def initialize(book)
    @space_id = book['name']
    @booked_date = book['booked_date']
    @resident = book['resident']
    @requested = book['requested']
    @confirmed = book['confirmed']
  end 
 
  
  def self.all 
    if ENV["ENVIRONMENT"] == 'test' 
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end 
    result = DatabaseConnection.query('SELECT * FROM booking;')
    result.map do |book|
      Booking.new(book)
    end
  end 

  def self.add(space_id:, booked_date:, resident:, requested:, confirmed:)
    if ENV["ENVIRONMENT"] == 'test' 
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end 

    connection.exec("INSERT INTO booking (space_id, booked_date, resident, requested, confirmed) VALUES( '#{space_id}', '#{booked_date}', '#{resident}', '#{requested}', '#{confirmed}') ; ")
  end
 
end