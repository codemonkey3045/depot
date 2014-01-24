require 'test_helper'

class CartTest < ActiveSupport::TestCase
	fixtures :products, :line_items

	def setup 
		@cart = Cart.create
		@book_1 = products(:one)
		@book_2	= products(:two)
	end
	
	test "cart with unique products" do
		@cart.add_product(@book_1.id).save!
		@cart.add_product(@book_2.id).save!

		# should have 2 items, 2 listings of 1 each, and sum (1+2)
		assert_equal 2, @cart.line_items.size
		assert 1, @cart.line_items[0].quantity 
		assert 1, @cart.line_items[1].quantity
		assert_equal @book_1.price + @book_2.price, @cart.total_price
	end

	test "cart with duplicate products" do 
		2.times do
			@cart.add_product(@book_1.id).save!
		end

		# should have 1 listings of 2, and sum (1+1)
		assert_equal 1, @cart.line_items.size
		assert_equal 2, @cart.line_items[0].quantity
		assert_equal @book_1.price*2, @cart.total_price
	end
end