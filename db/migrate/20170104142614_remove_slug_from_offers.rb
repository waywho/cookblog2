class RemoveSlugFromOffers < ActiveRecord::Migration
  def change
  	remove_column :offers, :slug, :string
  end
end
