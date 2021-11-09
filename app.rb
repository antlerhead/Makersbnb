require 'sinatra/base'
require './database_connection_setup'

class MakersAirBnB < Sinatra::Base 

  get '/' do 
    erb :homepage
  end 
  run! if app_file == $0
end 