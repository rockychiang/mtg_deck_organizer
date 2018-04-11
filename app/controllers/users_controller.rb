class UsersController < ApplicationController

  get '/' do
    if logged_in?
      redirect '/decks'
    else
      erb :index
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if !!user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/decks'
    else
      redirect '/'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/signup' do
    if logged_in?
      redirect '/decks'
    else
      erb :"/users/signup"
    end
  end

  post '/signup' do
    params.delete(:captures) if params.key?(:captures) && params[:captures].empty?
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect '/decks'
    else
      redirect '/signup'
    end
  end

end
