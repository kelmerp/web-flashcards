class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :status

      t.timestamps
      
      t.belongs_to :card
      t.belongs_to :round 
    end
  end
end
