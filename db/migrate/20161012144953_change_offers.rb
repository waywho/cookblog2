class ChangeOffers < ActiveRecord::Migration
  def change
  	rename_column :offers, :content, :description
  	rename_column :offers, :link, :deeplink_tracking
  	rename_column :offers, :expiration_date, :ends
  	add_column :offers, :promotion_id, :integer
  	add_column :offers, :advertiser, :string
  	add_column :offers, :advertiser_id, :integer
  	add_column :offers, :offer_type, :string
  	add_column :offers, :code, :string
  	add_column :offers, :starts, :datetime
  	add_column :offers, :categories, :string
  	add_column :offers, :regions, :string
  	add_column :offers, :terms, :text
  	add_column :offers, :deeplink, :string
    add_column :offers, :commission_groups, :string
  	add_column :offers, :commission, :string
  	add_column :offers, :exclusive, :string
  	add_column :offers, :date_added, :datetime
  end
end
