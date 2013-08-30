require 'csv'

User.create!(:email => "prater.nick@gmail.com",:password_digest => "password", :first_name => "Nick", :last_name => "Prater")
User.create!(:email => "leejart@gmail.com",:password_digest => "password", :first_name => "Art", :last_name => "Lee")
User.create!(:email => "kelmerp@gmail.com",:password_digest => "password", :first_name => "Kelmer", :last_name => "Perez")
User.create!(:email => "loverboy_jt@gmail.com",:password_digest => "password", :first_name => "Johnathon", :last_name => "Francis")

deck = Deck.create!(:name => "Ruby Deck 1")

CSV.foreach("./cards.csv") do |row|
  deck.cards << Card.create!(:answer => row[0], :question => row[1])
end

deck2 = Deck.create!(:name => "Ruby Deck 2")

CSV.foreach("./card2.csv") do |row|
  deck2.cards << Card.create!(:answer => row[0], :question => row[1])
end

User.first.decks << deck
User.last.decks << deck2
