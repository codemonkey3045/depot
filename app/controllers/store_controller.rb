class StoreController < ApplicationController
	skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  
  def index
debugger
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
debugger
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
