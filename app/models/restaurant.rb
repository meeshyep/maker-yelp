class Restaurant < ActiveRecord::Base
  has_attached_file :image, :default_url => ":style/default.png"
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
  validates :name, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :user, presence: true

  has_many :reviews, dependent: :destroy
  belongs_to :user


  def get_reviews(restaurant_id)
    Review.where(restaurant_id: restaurant_id)
  end

end
