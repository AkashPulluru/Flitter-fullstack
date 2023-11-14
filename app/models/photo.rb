class Photo < ApplicationRecord
        belongs_to :user, foreign_key: "UserID"
        has_many :album_photos, foreign_key: "PhotoID"
        has_many :albums, through: :album_photos
      
        validates :Title, :URL, presence: true
end
