class AddPartnerToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :partner_asset_id, :integer
  end
end
