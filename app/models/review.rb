class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :restaurant , presence: true
  # accepts_nested_attributes_for :restaurant
end
