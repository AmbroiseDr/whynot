class AddMovietitleImageurlToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :movie, :string
    add_column :users, :movie_title, :string
    add_column :users, :movie_year, :integer
    add_column :users, :movie_image_url, :string
  end
end
