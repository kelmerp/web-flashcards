class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds

  validates :name, presence: true, uniqueness: true

  def find_next_card(current_round_id)
    cards_no_guess = []
    cards_incorrect_guess = []
    # p self.cards
    self.cards.each do |card|
      # p card
      card_guesses = card.guesses.select {|guess| guess.round_id == current_round_id}
      # p card_guesses
      # return card_guesses
      correct_guesses = card_guesses.select {|guess| guess.status == "correct"}
      # p correct_guesses
      if card_guesses.empty?
        cards_no_guess << card
        # p cards_no_guess
      elsif correct_guesses.empty?
        cards_incorrect_guess << card 
        # p cards_no_guess
      end
    end
    if cards_no_guess.size >= 1
      return cards_no_guess.sample
    elsif cards_incorrect_guess.size >= 1
      return cards_incorrect_guess.sample
    else
      return nil
    end
  end

end
