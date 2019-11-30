class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :title, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 11}

  # if user 1 has already reviewed this product, user will see error
  validates :product, uniqueness: {scope: :user, message: "has already been reviewed by you."}
  
end
