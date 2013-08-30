#GET===========================================================================================

get '/round/deck/:deck_id/begin' do
  #@round = Round.create(:deck_id => params[:deck_id], :user_id => session[:user_id])
  @round = Round.create(:deck_id => 1, :user_id => 4)
  
  session[:current_round_id] = @round.id 
  @deck = @round.deck
  @card = @deck.find_next_card(session[:current_round_id])
  session[:current_card_id] = @card.id                                                                                      
  erb :round
end

get '/round/deck/:deck_id/question' do 
  @deck = Deck.find(params[:deck_id]) 
  @card = @deck.find_next_card(session[:current_round_id])
  erb :round
end

get '/round/deck/:deck_id/answer' do
  @deck = Deck.find(params[:deck_id]) 
  # @card = @deck.find_next_card(session[:current_round_id])
  p Round.find(session[:current_round_id])
  erb :round_answer 
end

#POST==========================================================================================

post '/round/deck/:deck_id' do
  
  redirect "/round/deck/#{params[:deck_id]}/answer"
end
