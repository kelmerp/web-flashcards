get '/deck/new' do
  
  erb :create_deck
end

post '/create_deck' do
  Deck.create_deck(params[:deck])
end
