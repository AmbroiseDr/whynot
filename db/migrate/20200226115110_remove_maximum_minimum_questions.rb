class RemoveMaximumMinimumQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :minimum, :integer
    remove_column :questions, :maximum, :integer
    add_column :questions, :type, :string
  end
end
