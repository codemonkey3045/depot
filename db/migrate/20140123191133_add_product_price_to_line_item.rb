class AddProductPriceToLineItem < ActiveRecord::Migration
  def change
  	add_column :line_items, :price, :decimal
  	LineItem.all.each do |item|
  		item.price = item.product.price
  		temp << "I am a " << item.class
  		logger.info temp
  	end
  end
end
