class Review < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :product
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  
  # Validations
  validates :rating, {
    numericality: {
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 5,
    },
  }

  def vote_total
    votes.up.count - votes.down.count
  end
end
