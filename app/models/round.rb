class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

  def self.calc_letter_grade(percentage)
    case percentage
    when 90..100
      "A"
    when 80..90
      "B"
    when 70..80
      "C"
    when 60..70
      "D"
    when 0..60
      "FAIL"
    else
      "You did something wrong."
    end
  end

  def find_incorrect_cards
    incorrect_cards = []
    cards = self.deck.cards
    cards.each do |card| 
      card_round_guesses = card.guesses.select {|card_guess| card_guess.round_id == self.id}
      card_round_guesses.each {|card_guess| incorrect_cards << card_guess.card if card_guess.status == "incorrect"}
    end
    incorrect_cards.uniq
  end

end
