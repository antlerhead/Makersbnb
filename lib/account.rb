require 'pg'
require 'bcrypt'

class Account
  attr_reader :id, :name, :login, :password, :host, :signedin, :booking_id

  # (id SERIAL PRIMARY KEY, name VARCHAR(60), login VARCHAR(60), password VARCHAR(60), host BIT, signedin BIT, booking_id INTEGER);

  def initialize(account)
    @account_id = account['id']
    @account_name = account['name']
    @login= account['login']
    @host = account['host']
    @signed_in = account['signed_in']
    @booking_id = account['booking_id']
  end 
 

  def self.all 
    if ENV["ENVIRONMENT"] == 'test' 
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end 
    result = DatabaseConnection.query('SELECT * FROM account;')
    result.map do |account|
      Account.new(account)
    end
  end 

  # (id SERIAL PRIMARY KEY, name VARCHAR(60), login VARCHAR(60), password VARCHAR(60), host BIT, signedin BIT, booking_id INTEGER);

  # def self.add(name:, login:, password:, host:, signedin:, booking_id:)
  #   if ENV["ENVIRONMENT"] == 'test' 
  #     connection = PG.connect(dbname: 'makersbnb_test')
  #   else 
  #     connection = PG.connect(dbname: 'makersbnb')
  #   end 
  #   connection.exec("INSERT INTO account (name, login, password, host, signedin, booking_id) VALUES( '#{name}', '#{login}', '#{password}', '#{host}', '#{signedin}', '#{booking_id}') ; ")
  # end
  require 'bcrypt'
require_relative './database_connection'


  def self.create(login:, password:)
    encrypted_password = BCrypt::Password.create(password)
    result = DatabaseConnection.query( "INSERT INTO account (login, password) VALUES($1, $2) RETURNING id, login;", [login, password])
    Account.new( id: result[0]['id'], login: result[0]['login'] )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query( "SELECT * FROM account WHERE id = $1", [id] )
    Account.new( id: result[0]['id'], login: result[0]['login'])
  end

  def self.authenticate(login:, password:)
    result = DatabaseConnection.query( "SELECT * FROM account WHERE login = $1", [login])
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    Account.new(id: result[0]['id'], login: result[0]['login'])
  end

  
 
end