class User < ActiveRecord::Base

  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
