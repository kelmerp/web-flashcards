class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  def self.correct_first_try(round_id)
    correct_first_try = []
    guesses = Guess.where(:round_id => round_id)
    guesses.each do |guess| 
      correct_first_try << guess if guess.card.guesses.size == 1
    end
    correct_first_try.size
end
