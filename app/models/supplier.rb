class Supplier < ApplicationRecord
  has_many :addresses, as: :person
  has_many :orders, as: :buyer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
