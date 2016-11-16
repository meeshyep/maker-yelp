class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :restaurants, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :restaurants, :through => :reviews

  def self.create_review(restaurant, currentUser, review_params)
    review = restaurant.reviews.create(review_params)
    review.user_id = currentUser
    review.save
  end
end
