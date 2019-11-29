class ChemGroup < ApplicationRecord
    has_many :products
    has_many :users, through: :products
end
