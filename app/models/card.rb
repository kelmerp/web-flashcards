class Card < ActiveRecord::Base
  has_many :guesses

  validates :question, presence: true 
  validates :answer, presence:true
end
