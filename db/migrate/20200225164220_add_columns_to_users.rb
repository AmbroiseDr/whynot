class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :description, :text
    add_column :users, :job, :string
    add_column :users, :age, :integer
    add_column :users, :mbti_creation, :string
    add_column :users, :letter_adjustement_first, :integer
    add_column :users, :letter_adjustement_second, :integer
    add_column :users, :letter_adjustement_third, :integer
    add_column :users, :letter_adjustement_fourth, :integer
  end
end
