class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  def self.get_correct_response
    correct_responses = ["Wow, that's beautiful!","Super duper job!","You're so smart!","Yeah, way to go!",
      "You're such a gem!","You are a beautiful princess!","Oh joy!","Congratulations Princess, you got it!",
      "Oh happy day!"]
    correct_responses.sample  
  end

  def self.get_incorrect_response
    incorrect_responses = ["Boo hoo, you suck!","That answer wasn't very pretty.","That makes me very sad.",
      "This is depressing, I need to go shopping.","This is quite painful.","Oh dear.",
      "There were no rainbows in that guess."]
    incorrect_responses.sample
  end

  def self.correct_first_try(round_id)
    correct_first_try = []
    round_guesses = Guess.where(:round_id => round_id)
    round_guesses.each do |guess| 
      card_guesses = guess.card.guesses
      correct_first_try << guess if card_guesses.select {|guess| guess.round_id == round_id}.size == 1
    end
    correct_first_try.size
  end
end
