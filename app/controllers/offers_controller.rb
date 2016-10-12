class OffersController < ApplicationController

	def index
		@offers = Offer.order(ends: :desc)
	end
end
