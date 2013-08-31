class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

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
