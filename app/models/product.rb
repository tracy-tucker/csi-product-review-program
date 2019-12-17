class Product < ApplicationRecord
  belongs_to :chem_group
  belongs_to :application_area
  belongs_to :category
  belongs_to :user #admin creator
  has_many :reviews
  has_many :users, through: :reviews #customer who reviews it
  has_one_attached :image
  accepts_nested_attributes_for :chem_group #tells the model to accept chem_group attributes from cg nested form in new product form
  accepts_nested_attributes_for :application_area

  validates :active_ingredient, presence: true
  validates :application_area, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validate :not_a_duplicate #checking for what we DON'T WANT
  after_validation :set_slug, only: [:create, :update, :show]

  def to_param
    "#{id}-#{slug}"
  end
  
  #scope model method - changing the view of the collection
  scope :order_by_rating, -> {left_joins(:reviews).group(:id).order('avg(rating) desc')}
  scope :most_reviews, -> {joins(:reviews).group('reviews.product_id').order("count(reviews.product_id) desc").limit(1)}
  
  def self.alpha
    order(:name)
  end

  #scope method
  def average_rating
    if self.reviews.size > 0
      self.reviews.average(:rating)
    else
      'no reviews'
    end
  end


  def chem_group_attributes=(attributes)
    self.chem_group = ChemGroup.find_or_create_by(attributes) if !attributes['name'].empty?
    self.chem_group
  end

  def application_area_attributes=(attributes)
    self.application_area = ApplicationArea.find_or_create_by(attributes) if !attributes['area_name'].empty?
    self.application_area
  end

  def thumbnail
    self.image.variant(resize: "100x100")
  end

  #if there is already a product with that name && chem_group, give error
  def not_a_duplicate
    #calling the instance of the attribute [string/integer: key]
      product = Product.find_by(name: name, chem_group_id: chem_group_id)
      if !!product && product != self
        errors.add(:name, 'has already been created for that Chemical Group')
      end
    end
  
    def name_and_chem_group
      "#{name} - #{chem_group.name}"
    end

    private
    
    def set_slug
      self.slug = name.to_s.parameterize
    end

end
