class ReviewController < ApplicationController

  attr_reader :id

  def new
    @id = params[:restaurant]
    p @id
  end

  def create
    @restaurant = Restaurant.find_by_id(params[:review][:id])
    @review = @restaurant.reviews.create(review_params)
    @review.save
    redirect_to '/restaurants/all'
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
    #  restaurant_attributes: [:id]
  end
end
