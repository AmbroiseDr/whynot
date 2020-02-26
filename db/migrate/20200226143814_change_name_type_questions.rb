class ChangeNameTypeQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :type, :string
    add_column :questions, :type_question, :string
  end
end
