class OffersController < ApplicationController

	def index
		@offers = Offer.order(ends: :desc).paginate(:page => params[:page])
	end
end
