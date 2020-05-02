class CreateProductOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :product_orders do |t|
    	t.belongs_to :product
    	t.belongs_to :order
    	t.integer :quantity
    end
  end
end
