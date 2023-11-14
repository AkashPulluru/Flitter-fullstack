class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums, id: :primary_key do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title, null: false
      t.string :description
      t.date :creation_date, null: false

      t.timestamps
    end
  end
end
