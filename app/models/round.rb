class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck

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
