class CreatePartnerAssets < ActiveRecord::Migration
  def change
    create_table :partner_assets do |t|
      t.string :retailer_domain
      t.string :logo_url

      t.timestamps null: false
    end
  end
end
