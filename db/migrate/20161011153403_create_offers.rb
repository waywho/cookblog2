class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.text :content
      t.datetime :expiration_date

      t.timestamps null: false
    end
    add_index :offers, :expiration_date
  end
end
