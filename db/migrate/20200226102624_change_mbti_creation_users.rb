class ChangeMbtiCreationUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :mbti_creation, :string
    add_reference :users, :profile_mbti, foreign_key: true
  end
end
