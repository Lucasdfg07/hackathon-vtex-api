class Order < ApplicationRecord
	belongs_to :buyer, polymorphic: true
	
	has_many :product_orders
	has_many :products, through: :product_orders

	validates_presence_of :status, :total
end
