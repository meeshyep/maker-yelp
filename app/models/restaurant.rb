class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true

  has_many :reviews, dependent: :destroy

  def get_reviews(restaurant_id)
    Review.where(restaurant_id: restaurant_id)
  end

end
