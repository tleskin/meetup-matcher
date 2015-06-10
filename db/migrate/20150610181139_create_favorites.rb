class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :name
      t.integer :user_id
      t.string :photo_url
      t.string :url_name
    end
  end
end
