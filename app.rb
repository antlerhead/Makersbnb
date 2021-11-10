require 'sinatra/base'
require './database_connection_setup'
require './lib/spaces'

class MakersAirBnB < Sinatra::Base 

  get '/' do 
    @list = Spaces.all 
    erb :homepage
  end 

  get '/add_list' do
    erb :add_page
  end

  post '/add_list' do
    Spaces.add(name: params['name'], description: params['description'], price: params['price'], from_date: params['from_date'], to_date: params['to_date'] )
    redirect '/'
  end


  run! if app_file == $0
end 