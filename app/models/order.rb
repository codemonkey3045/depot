class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]

	validates :name, :address, :email, :presense: true
	validates :pay_type, inclusion: PAYMENT_TYPES
end
