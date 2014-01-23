class StoreController < ApplicationController

  def index
  	@count = increment_counter
  	@display_count = display_count?
    @products = Product.order(:title)
  end


  protected 

	def increment_counter
		session[:counter] ||= 0
		count = session[:counter] += 1
	end

	def display_count?
		@count > 5 ? true : false
	end
end
