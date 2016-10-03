class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_tags

  	def load_tags
	  @tags = Recipe.published_now.tag_counts_on(:keyword)
	end
end
