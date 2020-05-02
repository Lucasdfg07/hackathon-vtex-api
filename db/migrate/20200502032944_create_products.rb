class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.belongs_to :supplier
      t.integer :in_market
      t.string :name
      t.float :value
      t.boolean :in_stock
      t.integer :quantity
      t.float :comission, default: 0
      t.string :photo
      t.timestamps
    end
  end
end
