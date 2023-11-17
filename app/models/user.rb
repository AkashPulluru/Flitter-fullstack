class User < ApplicationRecord

    validates :email, :password_digest,  presence: true
    validates :email, :password_digest, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    # validates :password, length: { in: 3..20 }

    has_secure_password
  
    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy
    has_many :comments
    has_many :favorites
    has_many :followings
    has_many :followers

    before_validation :ensure_session_token

    attr_reader :password

    def self.find_by_credentials(email, password)
      # debugger
      user = User.find_by(email: email)
      # debugger
        if user && user.is_password?(password)
          return user
        else
          return nil
        end
    end

    def reset_session_token!
      self.session_token = generate_session_token
      self.save!
      return self.session_token
    end

    def ensure_session_token
      self.session_token ||= generate_session_token
    end

    def generate_session_token
      SecureRandom.urlsafe_base64
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
