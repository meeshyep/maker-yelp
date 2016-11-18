class Restaurant < ActiveRecord::Base
  has_attached_file :image, :default_url => "https://static1.squarespace.com/static/545d5371e4b079130f435921/545d648fe4b00403fdd1b08c/54658cb9e4b0bc178ac9d855/1415941312846/_DLR5185.jpg"
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
