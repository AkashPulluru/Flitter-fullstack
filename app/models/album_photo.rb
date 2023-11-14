class AlbumPhoto < ApplicationRecord
        belongs_to :album, foreign_key: "AlbumID"
        belongs_to :photo, foreign_key: "PhotoID"
end
