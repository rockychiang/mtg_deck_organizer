class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "mtg_deck_secret"
  set :views, Proc.new { File.join(root, "../views/") }

end
