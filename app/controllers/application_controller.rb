class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "mtg_deck_secret"
  set :views, Proc.new { File.join(root, "../views/") }

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

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end
