#GET===========================================================================================

get '/round/:deck_id' do
  #@round = Round.create(:deck_id => params[:deck_id], :user_id => session[:user_id])
  @round = Round.create(:deck_id => 1, :user_id => 4)
  @deck = @round.deck 
  @card = @deck.cards.where
  erb :round
end

#POST==========================================================================================

post '/round/:deck_id' do
  
end
