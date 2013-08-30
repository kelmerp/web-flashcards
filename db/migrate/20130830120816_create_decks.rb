class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.name

      t.timestamps

      t.belongs_to :user
    end
    add_index :decks, :name, :unique => true
  end
end
