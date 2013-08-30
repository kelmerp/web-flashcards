require 'csv'

User.create!(:email => "prater.nick@gmail.com", :password => "password",:password_confirmation => "password", :first_name => "Nick", :last_name => "Prater")
User.create!(:email => "leejart@gmail.com", :password => "password", :password_confirmation => "password", :first_name => "Art", :last_name => "Lee")
User.create!(:email => "kelmerp@gmail.com", :password => "password", :password_confirmation => "password", :first_name => "Kelmer", :last_name => "Perez")
User.create!(:email => "loverboy_jt@gmail.com", :password => "password", :password_confirmation => "password", :first_name => "Johnathon", :last_name => "Francis")

deck = Deck.create!(:name => "Ruby Deck 1")

CSV.foreach("./db/cards.csv", :headers => true) do |row|
  deck.cards << Card.create!(:answer => row["word"], :question => row["definition"])
end

deck2 = Deck.create!(:name => "Ruby Deck 2")

CSV.foreach("./db/card2.csv", :headers => true) do |row|
  deck2.cards << Card.create!(:answer => row["word"], :question => row["definition"])
end

User.first.decks << deck
User.last.decks << deck2
