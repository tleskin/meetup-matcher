class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :photo_url
      t.string :url_name
    end
  end
end
