class AlbumPhoto < ApplicationRecord
        belongs_to :album, foreign_key: "album_id"
        belongs_to :photo, foreign_key: "photo_id"
end
