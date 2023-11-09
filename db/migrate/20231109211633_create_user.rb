class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, uniqueness: true 
      t.string :email, null: false, uniqueness: true
      t.string :password_digest, null: false, uniqueness: true
      t.string :full_name
      t.date :join_date, null: false, uniqueness: true
      t.string :bio 
      t.string :website 
      t.string :profile_picture     
      t.string :session_token, uniqueness: true 
      t.timestamps

      add_index :username, :email 
    end
  end
end
