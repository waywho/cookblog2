class Photo < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :recipe
	before_create :default_name
	acts_as_xlsx

	def image=(val)
    	if !val.is_a?(String) && valid?
      		image_will_change!
      		super
    	end
  	end

	def default_name
		self.caption ||= File.basename(image.filename, '.*').titleize if image
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
			item.save!
		end
	end

end
