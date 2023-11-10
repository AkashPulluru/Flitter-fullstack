class User < ApplicationRecord

    validates :username, :email, :password_digest, :join_date, presence: true
    validates :username, :email, :password_digest, uniqueness: true

  
    has_many :photos
    has_many :albums
    has_many :comments
    has_many :favorites
    has_many :followings
    has_many :followers


    before_create :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64()
  end

  def reset_session_token!
    self.session_token = self.generate_session_token
    save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.generate_session_token
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user && user.authenticate(password)
    user
  end

  
end
