class CreateCards < ActiveRecord::Migration
  def change
    create_deck :cards do |t|
      t.string :question
      t.string :answer

      t.timestamps

      t.belongs_to :deck
    end
  end
end
