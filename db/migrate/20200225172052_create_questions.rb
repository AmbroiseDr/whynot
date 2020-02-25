class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :minimum
      t.integer :maximum
      t.integer :letter_position

      t.timestamps
    end
  end
end
