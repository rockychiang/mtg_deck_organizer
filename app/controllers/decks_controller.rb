class DecksController < ApplicationController

  get '/decks' do
    if logged_in?
      @decks = Deck.all
      erb :"/decks/decks"
    else
      redirect '/'
    end
  end

  get '/decks/:id' do
    if logged_in?
      @deck = Deck.find(params[:id])
      erb :"/decks/show"
    else
      redirect '/'
    end
  end

  get '/decks/:id/edit' do
    if logged_in?
      @deck = Deck.find(params[:id])
      if current_user == @deck.user
        erb :"/decks/edit"
      else
        redirect :"/decks/#{@deck.id}"
      end
    else
      redirect '/'
    end
  end

end
