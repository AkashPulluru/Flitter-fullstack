class User < ApplicationRecord

    validates :email, :password_digest,  presence: true
    validates :email, :password_digest, uniqueness: true

    has_secure_password
  
    has_many :photos
    has_many :albums
    has_many :comments
    has_many :favorites
    has_many :followings
    has_many :followers


    before_validation :ensure_session_token

    attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = self.generate_session_token
    self.save!
    return self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.generate_session_token
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(username: username)

        # user && user.is_password?(password) ? user : nil
        if user && user.is_password?(password)
            #success
            return user
        else
            #failure
            return nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    return password
  end

  def is_password?(password)
    bcrypt_hash = BCrypt::Password.new(self.password_digest)
    bcrypt_hash.is_password?(password)
  end


end
