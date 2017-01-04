class Offer < ActiveRecord::Base
	# before_save :set_defaults
	before_save :set_relationship
	belongs_to :partner_asset

	has_paper_trail
	acts_as_xlsx

	# def set_defaults
 #    	self.title = "#{self.advertiser} #{self.starts.strftime('%m-%d')}" if self.new_record?
 #  	end

 	def set_relationship
 		if self.deeplink.present?
 			domain = URI.parse(self.deeplink).host
 			self.partner_asset_id = PartnerAsset.where(:retailer_domain => domain).first.id
 		end
 	end

 	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			item = find_by_id(row["id"]) || new
			item.attributes = row.to_hash.slice(*self.column_names)
			item.title = "#{item.advertiser} #{item.starts.strftime('%d-%m-%Y')}" if item.starts.present?
			item.save!
		end
	end
end
