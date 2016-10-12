class AddLinkColumnToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :link, :text
  end
end
