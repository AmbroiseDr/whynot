class ChangeDescriptionTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :description, :text
    add_column :users, :description, :string
  end
end
