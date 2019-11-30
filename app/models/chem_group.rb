class ChemGroup < ApplicationRecord
    has_many :products
    has_many :users, through: :products

    # scope :associated_product, -> {left_joins(:products).group(:id).where('name')}

end
