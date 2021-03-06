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

deck3 = Deck.create!(:name => "Test Deck")

deck3.cards << Card.create!(:answer => "A", :question => "What is the first letter of the alphabet?")
deck3.cards << Card.create!(:answer => "B", :question => "What is the second letter of the alphabet?")
deck3.cards << Card.create!(:answer => "C", :question => "What is the third letter of the alphabet?")

deck4= Deck.create!(:name => "Sublime Text Shortcuts")

CSV.foreach("./db/sublime_shortcuts.csv", :headers => true) do |row|
  deck4.cards << Card.create!(:answer => row["Keypress"], :question => row["Command"])
end
