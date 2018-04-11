class DeckController < ApplicationController

  get '/decks' do
    if logged_in?
      erb :"/decks/decks"
    else
      redirect '/'
    end
  end

end
