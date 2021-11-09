require 'pg'

class DatabaseConnection

  def self.setup
    @connection =
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'makersbnb_test')
      else
        PG.connect(dbname: 'makersbnb')
      end
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end 