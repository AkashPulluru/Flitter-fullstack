class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos, id: :primary_key do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title, null: false
      t.string :description
      t.datetime :upload_date, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end
