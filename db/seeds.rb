# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ApplicationRecord.transaction do 
    puts "Destroying tables..."
    
    User.destroy_all
  
    puts "Resetting primary keys..."
    
    ApplicationRecord.connection.reset_pk_sequence!('users')
  
    puts "Creating users..."


User.create!(
  email: 'user1@example.com',
  password_digest: BCrypt::Password.create('password1'),
  first_name: 'John',
  last_name: 'Doe',
  bio: 'I love coding!',
  website: 'https://www.example.com/user1',
  session_token: SecureRandom.base64,
  created_at: Time.now,
  updated_at: Time.now
)

User.create!(
  email: 'user2@example.com',
  password_digest: BCrypt::Password.create('password2'),
  first_name: 'Jane',
  last_name: 'Smith',
  bio: 'Web developer and designer',
  website: 'https://www.example.com/user2',
  session_token: SecureRandom.base64,
  created_at: Time.now,
  updated_at: Time.now
)

User.create!(
  email: 'user3@example.com',
  password_digest: BCrypt::Password.create('password3'),
  first_name: 'Alice',
  last_name: 'Johnson',
  bio: 'Passionate about technology',
  website: 'https://www.example.com/user3',
  session_token: SecureRandom.base64,
  created_at: Time.now,
  updated_at: Time.now
)

User.create!(
  email: 'user4@example.com',
  password_digest: BCrypt::Password.create('password4'),
  first_name: 'Bob',
  last_name: 'Williams',
  bio: 'Software engineer',
  website: 'https://www.example.com/user4',
  session_token: SecureRandom.base64,
  created_at: Time.now,
  updated_at: Time.now
)

User.create!(
  
  email: 'user5@example.com',
  password_digest: BCrypt::Password.create('password5'),
  first_name: 'Eva',
  last_name: 'Brown',
  bio: 'Full-stack developer',
  website: 'https://www.example.com/user5',
  session_token: SecureRandom.base64,
  created_at: Time.now,
  updated_at: Time.now
)


# db/seeds.rb


user = User.first || User.create!(email: 'user15@example.com', password_digest: 'password', first_name: 'John', last_name: 'Doe', session_token: 'session1234')

user1 = User.create!(email: "user1@example.com", password_digest: "password1", first_name: "John", last_name: "Doe", session_token: "token1")
user2 = User.create!(email: "user2@example.com", password_digest: "password2", first_name: "Jane", last_name: "Doe", session_token: "token2")

album1 = Album.create!(user_id: user1.id, title: "Album Title 1", description: "Album 1 Description", creation_date: Date.today)
album2 = Album.create!(user_id: user1.id, title: "Album Title 2", description: "Album 2 Description", creation_date: Date.today)
album3 = Album.create!(user_id: user2.id, title: "Album Title 3", description: "Album 3 Description", creation_date: Date.today)

photo1_1 = Photo.create!(user_id: user1.id, title: "Photo Title 1-1", description: "Description 1-1", upload_date: DateTime.now, url: "http://example.com/photo1-1.jpg")
photo1_2 = Photo.create!(user_id: user1.id, title: "Photo Title 1-2", description: "Description 1-2", upload_date: DateTime.now, url: "http://example.com/photo1-2.jpg")
photo1_3 = Photo.create!(user_id: user1.id, title: "Photo Title 1-3", description: "Description 1-3", upload_date: DateTime.now, url: "http://example.com/photo1-3.jpg")
photo1_4 = Photo.create!(user_id: user1.id, title: "Photo Title 1-4", description: "Description 1-4", upload_date: DateTime.now, url: "http://example.com/photo1-4.jpg")
photo1_5 = Photo.create!(user_id: user2.id, title: "Photo Title 1-5", description: "Description 1-5", upload_date: DateTime.now, url: "http://example.com/photo1-5.jpg")
photo1_6 = Photo.create!(user_id: user2.id, title: "Photo Title 1-6", description: "Description 1-6", upload_date: DateTime.now, url: "http://example.com/photo1-6.jpg")
photo1_7 = Photo.create!(user_id: user2.id, title: "Photo Title 1-7", description: "Description 1-7", upload_date: DateTime.now, url: "http://example.com/photo1-7.jpg")
photo1_8 = Photo.create!(user_id: user2.id, title: "Photo Title 1-8", description: "Description 1-8", upload_date: DateTime.now, url: "http://example.com/photo1-8.jpg")
photo1_9 = Photo.create!(user_id: user2.id, title: "Photo Title 1-9", description: "Description 1-9", upload_date: DateTime.now, url: "http://example.com/photo1-9.jpg")


AlbumPhoto.create!(album_id: album1.id, photo_id: photo1_1.id)
AlbumPhoto.create!(album_id: album1.id, photo_id: photo1_2.id)
AlbumPhoto.create!(album_id: album1.id, photo_id: photo1_3.id)

puts "Done!"
end

