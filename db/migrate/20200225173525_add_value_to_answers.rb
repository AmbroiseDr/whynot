class AddValueToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :value, :integer
  end
end
