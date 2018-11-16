class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :name, null: false
      t.integer :year, null: false
      t.string :type, null: false
      t.timestamps
    end
    add_index :albums, [:band_id, :name], unique: true
  end
end
