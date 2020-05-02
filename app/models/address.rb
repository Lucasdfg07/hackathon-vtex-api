class Address < ApplicationRecord
	belongs_to :person, polymorphic: true
	belongs_to :city

	validates_presence_of :cep, :street, :complement, :neighborhood
end
