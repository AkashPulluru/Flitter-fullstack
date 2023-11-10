class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false, unique: true
      t.string :full_name
      t.date :join_date, null: false
      t.text :bio
      t.string :website
      t.string :profile_picture
      t.string :session_token
      t.timestamps
      end

      add_index :users, :username
      add_index :users, :email
    end 
end

