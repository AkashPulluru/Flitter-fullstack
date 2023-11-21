class Photo < ApplicationRecord
        belongs_to :user, foreign_key: "user_id"
        has_many :album_photos, foreign_key: "photo_id", dependent: :destroy
        has_many :albums, through: :album_photos      
        validates :title, :url, presence: true
        has_many :comments, dependent: :destroy
end
