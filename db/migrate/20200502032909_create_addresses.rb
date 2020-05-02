class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :person, polymorphic: true
      t.belongs_to :city
      t.string :cep
      t.string :street
      t.string :complement
      t.string :neighborhood
      t.timestamps
    end
  end
end
