class ReviewController < ApplicationController
  def new
    @id = params[:restaurant]
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
  end
end
