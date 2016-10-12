class AddSlugToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :slug, :string
    add_index :offers, :slug
  end
end
