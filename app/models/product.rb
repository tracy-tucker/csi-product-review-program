class Product < ApplicationRecord
  belongs_to :chem_group
  belongs_to :user
end
