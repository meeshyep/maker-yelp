class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :restaurant , presence: true
  belongs_to :user
end
