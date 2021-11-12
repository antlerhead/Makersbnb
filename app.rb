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
     @from_date = params["from_date"]
    redirect '/booking_form'
  end

  post '/booking' do 
      params["booked_date"]
      Booking.add(space_id: 1, booked_date: params['booked_date'], resident: 20, requested: 1, confirmed: 0 )
      @booking = params["booked_date"]
      @space = params["name"]
     erb :booking
  end 

  get '/booking_form' do 
   @space_id = params["id"]
   @space_name = params["name"]
   @from_date = params["fromdate"]
   @to_date = params["todate"]
  erb :booking_form
  end 

  run! if app_file == $0
end 