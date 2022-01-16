class Warehouse < ApplicationRecord
    has_many :assignments
    has_many :products, through: :assignments
    validates :location, presence: true
    validates :postal_code, presence: true
end
