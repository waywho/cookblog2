class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.integer :imageable_id
      t.string :imageable_type
      t.string :image

      t.timestamps null: false
    end
    add_index :photos, :imageable_id
    add_index :photos, :imageable_type
  end
end
