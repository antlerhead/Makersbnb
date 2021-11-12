require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require './database_connection_setup'
require './lib/spaces'
require './lib/booking'
require './lib/account'

class MakersAirBnB < Sinatra::Base 
  enable :sessions, :method_override
  register Sinatra::Flash
  
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


  get '/signup' do
    erb :login_page
  end

  get '/login' do
    erb :sign_in
  end

  post '/user_account' do
    user = Account.create(login: params['login'], password: params['password'])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/sessions' do
    user = Account.authenticate(login: params[:login], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('login')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/login')
  end



  run! if app_file == $0
end 