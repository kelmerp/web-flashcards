class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.timestamps
      
      t.belongs_to :user
      t.belongs_to :deck
    end
  end
end
