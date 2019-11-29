class User < ApplicationRecord

    has_many :reviews
    has_many :reviewed_products, through: :reviews, source: :product #creates the relation to Review (belongs_to product)
    has_many :products
    has_many :chem_groups, through: :products
    has_many :application_areas, through: :products
    
    has_secure_password
end
