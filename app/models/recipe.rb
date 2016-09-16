class Recipe < ActiveRecord::Base
	acts_as_xlsx
	has_many :photos
	accepts_nested_attributes_for :photos, allow_destroy: true
	
	extend FriendlyId
	friendly_id :title, use: :slugged

	has_paper_trail

	include Workflow

	workflow do
		state :draft do
			event :publish, transition_to: :published
		end

		state :published do
			event :unpublish, transition_to: :draft
		end
	end

	def self.states
		workflow_spec.state_names
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
