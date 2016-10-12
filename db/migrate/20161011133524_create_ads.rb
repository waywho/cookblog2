class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.text :content
      t.string :position

      t.timestamps null: false
    end
    add_index :ads, :position
  end
end
