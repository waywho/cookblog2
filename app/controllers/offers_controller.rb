class OffersController < ApplicationController

	def index
		@offers = Offer.where('expiry_date <= ?', Time.zone.now)
	end
end
