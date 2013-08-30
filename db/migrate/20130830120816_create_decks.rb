class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name

      t.timestamps

      t.belongs_to :user
    end
    add_index :decks, :name, :unique => true
  end
end
