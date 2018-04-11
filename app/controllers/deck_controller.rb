class DeckController < ApplicationController

  get '/decks' do
    erb :"/decks/decks"
  end

end
