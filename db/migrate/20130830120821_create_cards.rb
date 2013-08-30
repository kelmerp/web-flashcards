class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :question
      t.string :answer

      t.timestamps

      t.belongs_to :deck
    end
  end
end
