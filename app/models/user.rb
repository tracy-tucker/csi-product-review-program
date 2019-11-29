class User < ApplicationRecord

    has_many :reviews
    has_many :reviewed_products, through: :reviews, source: :product #creates the relation to Review (belongs_to product)
    has_many :products
    has_many :chem_groups, through: :products
    has_many :application_areas, through: :products

    validates :username, uniqueness: true, presence: true #uniqueness of each username. Protects against dup records.

    has_secure_password

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
        end
    end
end
