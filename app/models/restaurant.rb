class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true

  has_many :reviews, dependent: :destroy
end
