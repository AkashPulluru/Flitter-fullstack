class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.primary_key :AlbumID
      t.integer :UserID
      t.string :Title
      t.string :Description
      t.date :CreationDate

      t.timestamps
    end
  end
end
