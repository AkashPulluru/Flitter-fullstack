class RemoveDatesFromAlbumsAndPhotos < ActiveRecord::Migration[7.1]
  def change
    remove_column :albums, :creation_date, :date
    remove_column :photos, :upload_date, :datetime
  end
end
