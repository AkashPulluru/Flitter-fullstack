class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :full_name
      t.date :join_date
      t.string :bio
      t.string :website
      t.string :profile_picture
      t.string :session_token

      t.timestamps
    end
  end
end
