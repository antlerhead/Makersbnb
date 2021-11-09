require 'sinatra/base'
require './database_connection_setup'
require './lib/spaces'

class MakersAirBnB < Sinatra::Base 

  get '/' do 
    @list = Spaces.all 
    p @list 
    erb :homepage
  end 

  run! if app_file == $0
end 