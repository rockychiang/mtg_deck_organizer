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
    if !!user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/decks'
      else
        session[:error] = "password did not match our records."
        redirect '/'
      end
    else
      session[:error] = "no user with that email found."
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

  get '/users/:username' do
    if logged_in?
      @user = User.find_by(username: params[:username])
      erb :"/users/show"
    else
      redirect '/'
    end
  end

end
