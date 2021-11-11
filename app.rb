require 'sinatra/base'
require './database_connection_setup'
require './lib/spaces'
require './lib/booking'

class MakersAirBnB < Sinatra::Base 

  get '/' do 
    @list = Spaces.all 
    erb :homepage
  end 

  get '/add_list' do
    erb :add_page
  end

  get '/booking' do 
    erb :booking
  end 

  post '/add_list' do
    Spaces.add(name: params['name'], description: params['description'], price: params['price'], from_date: params['from_date'], to_date: params['to_date'] )
    p '+++++++++'
    p @from_date = params["from_date"]
    p '++++++++++++'
    redirect '/booking_form'
  end

  post '/booking' do 
     Booking.add(space_id: 1, booked_date: params['booked_date'], resident: 20, requested: 1, confirmed: 0 )
     redirect '/'
  end 

  get '/booking_form' do 
  p '_______________'
  p params["from_date"]
  p params["to_date"]
  p '_______________'
  erb :booking_form
  end 
  run! if app_file == $0
end 