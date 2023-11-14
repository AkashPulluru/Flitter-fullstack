class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.primary_key :PhotoID
      t.integer :UserID
      t.string :Title
      t.string :Description
      t.datetime :UploadDate
      t.string :URL

      t.timestamps
    end
  end
end
