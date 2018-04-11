class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "mtg_deck_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
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

end
