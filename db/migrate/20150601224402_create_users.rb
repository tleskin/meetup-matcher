class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :provider
      t.string :token
      t.string :uid
      t.string :location
      t.string :image_url

      t.timestamps null: false
    end
  end
end
