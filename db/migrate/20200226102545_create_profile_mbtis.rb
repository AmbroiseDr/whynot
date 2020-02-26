class CreateProfileMbtis < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_mbtis do |t|
      t.string :mbti
      t.text :description

      t.timestamps
    end
  end
end
