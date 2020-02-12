class Product < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favouriters, through: :favourites, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  # Validations
  validates(:title, presence: true, uniqueness: true, case_sensitive: false)
  validates(:price, numericality: { greater_than: 0 })
  validates(:description, presence: true, length: { minimum: 10 })

  # Call Backs
  before_validation :set_default_value_price
  before_save :capitalize_product_title

  # Custom methods
  scope(:search, ->(query) { where("title ILIKE?", "%#{query}%") })

  private

  def set_default_value_price
    self.price ||= 1
  end

  def capitalize_product_title
    self.title.capitalize!
  end
end
