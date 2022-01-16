class Product < ApplicationRecord
    has_many :assignments
    has_many :warehouses, through: :assignments
    validates :name, presence: true
    validates :description, presence: true, length: { minimum: 10 }
    validates :brand, presence: true
    validates :quantity, presence: true
    validates :price, presence: true
end
