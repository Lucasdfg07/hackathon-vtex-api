class Product < ApplicationRecord
	belongs_to :category
	belongs_to :supplier

	has_many :product_orders
	has_many :orders, through: :product_orders

	validates_presence_of :name, :value, :in_stock, :quantity, :comission
end
