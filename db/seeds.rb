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
    # Unnecessary if using `rails db:seed:replant`
    User.destroy_all
  
    puts "Resetting primary keys..."
    # For easy testing, so that after seeding, the first `User` has `id` of 1
    ApplicationRecord.connection.reset_pk_sequence!('users')
  
    puts "Creating users..."
    # Create one user with an easy to remember username, email, and password:

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

puts "Done!"
end

