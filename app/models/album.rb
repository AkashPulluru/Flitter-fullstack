class Album < ApplicationRecord
        belongs_to :user, foreign_key: "UserID"
        has_many :album_photos, foreign_key: "AlbumID"
        has_many :photos, through: :album_photos
      
        validates :Title, presence: true
end
