class Recipe < ActiveRecord::Base
	acts_as_xlsx
	has_one :photo
	accepts_nested_attributes_for :photo, allow_destroy: true
	has_many :ingredient_forms
	has_many :ingredients, through: :ingredient_forms
	accepts_nested_attributes_for :ingredient_forms, allow_destroy: true
	
	acts_as_taggable_on :keyword

	CATEGORIES = ["Main Dish", "Dessert", "Articles & Tips", "Deals"]

	extend FriendlyId
	friendly_id :title, use: :slugged

	has_paper_trail

	scope :published_now, -> { self.with_published_state.where('published_at <= ?', Time.zone.now)}
	scope :feature_recipe, -> { self.published_now.last}
	scope :main_dishes, -> {self.published_now.where(category: "Main Dish")}
	scope :desserts, -> {self.published_now.where(category: "Dessert")}
	scope :articles_tips, -> {self.published_now.where(category: "Articles & Tips")}
	scope :deals, -> {self.published_now.where(category: "Deals")}

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
	
	def publish
		update_attribute(:published_at, Time.zone.now) if self.published_at.nil?
		# menus.create(name: self.title, menu_type: 'main')
	end

	def unpublish
		update_attribute(:published_at, nil)
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
