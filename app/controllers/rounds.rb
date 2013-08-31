#GET===========================================================================================

get '/round/deck/:deck_id/begin' do
  #@round = Round.create(:deck_id => params[:deck_id], :user_id => session[:user_id])
  @round = Round.create(:deck_id => 3, :user_id => 4)
  
  session[:current_round_id] = @round.id 
  @deck = @round.deck
  @card = @deck.find_next_card(session[:current_round_id])
  session[:current_card_id] = @card.id
  @guesses = Guess.where(:round_id => session[:current_round_id])
  @number_attempted = @guesses.size
  @number_correct = @guesses.select {|guess| guess.status == "correct"}.size                                                                                      
  erb :round
end

get '/round/deck/:deck_id/card/:card_id/question' do 
  @deck = Deck.find(params[:deck_id]) 
  @card = @deck.find_next_card(session[:current_round_id])
  @guesses = Guess.where(:round_id => session[:current_round_id])
  @number_attempted = @guesses.size
  @number_correct = @guesses.select {|guess| guess.status == "correct"}.size
  if @card == nil
    redirect '/round/results'
  else
    erb :round
  end
end

get '/round/deck/:deck_id/card/:card_id/answer' do
  @deck = Deck.find(params[:deck_id]) 
  @card = Card.find(params[:card_id])
  @guesses = Guess.where(:round_id => session[:current_round_id])
  @number_attempted = @guesses.size
  @number_correct = @guesses.select {|guess| guess.status == "correct"}.size
  erb :round_answer 
end

get '/round/results' do
  @total_cards = Round.find(session[:current_round_id]).deck.cards.size
  @correct_first_try = Guess.correct_first_try(session[:current_round_id])
  @incorrect_cards = Round.find(session[:current_round_id]).find_incorrect_cards 
  erb :results 
end

#POST==========================================================================================

post '/guess/:deck_id/:card_id' do
  card = Card.find(params[:card_id])
  if params[:guess].downcase == card.answer.downcase
    card.guesses << Guess.create(:status => "correct",:round_id => session[:current_round_id])
  else
    card.guesses << Guess.create(:status => "incorrect",:round_id => session[:current_round_id])
  end
  redirect "/round/deck/#{params[:deck_id]}/card/#{params[:card_id]}/answer"
end
