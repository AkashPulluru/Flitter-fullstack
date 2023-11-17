class Album < ApplicationRecord
        belongs_to :user, foreign_key: "user_id"
        has_many :album_photos, foreign_key: "album_id", dependent: :destroy    
        has_many :photos, through: :album_photos
      
        validates :title, presence: true
end
