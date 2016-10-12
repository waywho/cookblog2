class Offer < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	has_paper_trail
end
