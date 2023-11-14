class CreateAlbumPhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :album_photos do |t|
      t.integer :AlbumID
      t.integer :PhotoID

      t.timestamps
    end
  end
end
