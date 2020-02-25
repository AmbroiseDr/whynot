class AddColumnsAgainToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :movie, :string
    add_column :users, :song, :string
    add_column :users, :smiley, :string
  end
end
