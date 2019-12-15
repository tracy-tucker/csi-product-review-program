class ApplicationArea < ApplicationRecord
    has_many :products
    has_many :users, through: :products

    validates :area_name, presence: true
    validates :area_name, uniqueness: true
    
end
