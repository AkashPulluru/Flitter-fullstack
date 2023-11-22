# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

## destroy tables in order of dependencies - 

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  AlbumPhoto.destroy_all
  Album.destroy_all 
  Photo.destroy_all
  User.destroy_all

  puts "Resetting primary keys..."
  
  ApplicationRecord.connection.reset_pk_sequence!('users')
  ApplicationRecord.connection.reset_pk_sequence!('photos')

User.create!(
  email: 'user1@example.com',
  password: 'password1',
  first_name: 'John',
  last_name: 'Doe',
  bio: 'I love coding and taking pictures! If you want to know more, I would love to connnect',
  website: 'https://www.example.com/user1'

)

User.create!(
  email: 'user2@example.com',
  password: 'password2',
  first_name: 'Jane',
  last_name: 'Smith',
  bio: 'Web developer and designer',
  website: 'https://www.example.com/user2'

)

User.create!(
  email: 'user3@example.com',
  password: 'password3',
  first_name: 'Alice',
  last_name: 'Johnson',
  bio: 'Passionate about technology',
  website: 'https://www.example.com/user3'

)

User.create!(
  email: 'user4@example.com',
  password: 'password4',
  first_name: 'Bob',
  last_name: 'Williams',
  bio: 'Software engineer',
  website: 'https://www.example.com/user4'

)

user3 = User.create!(
  email: 'user5@example.com',
  password: 'password5',
  first_name: 'Eva',
  last_name: 'Brown',
  bio: 'I am a full-stack developer based out of Chicago.',
  website: 'https://www.example.com/user5'

)



# user = User.first || User.create!(email: 'user15@example.com', password_digest: 'password', first_name: 'John', last_name: 'Doe', session_token: 'session1234')

user1 = User.create!(email: "user12@example.com", password: "password21", first_name: "John", last_name: "Doe", session_token: "token1")
user2 = User.create!(email: "user23@example.com", password: "password23", first_name: "Jane", last_name: "Doe", session_token: "token2")

puts user1.id
puts user2.id 
# puts user2.All

album1 = Album.create!(user_id: user3.id, title: "Album Title 1", description: "Album 1 Description")
album2 = Album.create!(user_id: user3.id, title: "Album Title 2", description: "Album 2 Description")
album3 = Album.create!(user_id: user3.id, title: "Album Title 3", description: "Album 3 Description")

photo1_1 = Photo.create!(user_id: user1.id, title: "Midday Coffee", description: "Description 1-1", url: "https://flitter-fullstack-seeds.s3.amazonaws.com/coffee.jpg")
photo1_2 = Photo.create!(user_id: user1.id, title: "Fish at Peace", description: "Description 1-2", url: "https://flitter-fullstack-seeds.s3.amazonaws.com/fish.jpg")
photo1_3 = Photo.create!(user_id: user1.id, title: "Slices of Life", description: "Description 1-3", url: "https://flitter-fullstack-seeds.s3.amazonaws.com/gas-station.jpg")
photo1_4 = Photo.create!(user_id: user1.id, title: "On the Road", description: "Description 1-4", url: "https://flitter-fullstack-seeds.s3.amazonaws.com/car.jpg")
photo1_5 = Photo.create!(user_id: user2.id, title: "Nature, Untouched", description: "Description 1-5", url: "https://flitter-fullstack-seeds.s3.amazonaws.com/leaves.jpg")
photo1_6 = Photo.create!(user_id: user3.id, title: "My Path Diverged", description: "Description 1-6", url: "https://flitter-fullstack-seeds.s3.amazonaws.com/path.jpg")
photo1_7 = Photo.create!(user_id: user3.id, title: "Woodland Wonder", description: "Description 1-7", url: "https://flitter-fullstack-seeds.s3.amazonaws.com/trees.jpg")
photo1_8 = Photo.create!(user_id: user3.id, title: "Water at Work", description: "Description 1-8", url: "https://flitter-fullstack-seeds.s3.amazonaws.com/waterfalls.jpg")

AlbumPhoto.create!(album_id: album1.id, photo_id: photo1_1.id)
AlbumPhoto.create!(album_id: album1.id, photo_id: photo1_2.id)
AlbumPhoto.create!(album_id: album1.id, photo_id: photo1_3.id)

Comment.create!(photo_id: photo1_1.id, user_id: user1.id, comment_text: "Love this photo!")
Comment.create!(photo_id: photo1_2.id, user_id: user2.id, comment_text: "Amazing shot!")
Comment.create!(photo_id: photo1_3.id, user_id: user3.id, comment_text: "Great capture!")
Comment.create!(photo_id: photo1_4.id, user_id: user3.id, comment_text: "Stunning view!")
Comment.create!(photo_id: photo1_5.id, user_id: user2.id, comment_text: "Beautiful colors in this one.")
Comment.create!(photo_id: photo1_2.id, user_id: user3.id, comment_text: "This is one of my favorites!")
Comment.create!(photo_id: photo1_3.id, user_id: user1.id, comment_text: "What type of camera did they use?")

puts "Done!"

end