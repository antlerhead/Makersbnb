require 'pg'

class Account
  attr_reader :id, :name, :login, :password, :host, :signedin, :booking_id

  # (id SERIAL PRIMARY KEY, name VARCHAR(60), login VARCHAR(60), password VARCHAR(60), host BIT, signedin BIT, booking_id INTEGER);

  def initialize(account)
    @id = space['id']
    @name = space['name']
    @login= space['login']
    @host = space['host']
    @signed_in = space['signed_in']
    @booking_id = space['booking_id']
  end 
 
  
  def self.all 
    if ENV["ENVIRONMENT"] == 'test' 
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end 
    result = DatabaseConnection.query('SELECT * FROM account;')
    result.map do |account|
      Spaces.new(account)
    end
  end 

  # (id SERIAL PRIMARY KEY, name VARCHAR(60), login VARCHAR(60), password VARCHAR(60), host BIT, signedin BIT, booking_id INTEGER);

  def self.add(name:, login:, password:, host:, signedin:, booking_id:)
    if ENV["ENVIRONMENT"] == 'test' 
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end 
    connection.exec("INSERT INTO account (name, login, password, host, signedin, booking_id) VALUES( '#{name}', '#{login}', #{password}, CAST (#{host} AS bit), CAST (#{signedin} AS bit), #{booking_id}) ; ")
  end
 
end