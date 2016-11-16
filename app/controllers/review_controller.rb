class ReviewController < ApplicationController
  before_action do
    @currentUser = current_user.id
  end

  def new
    @id = params[:restaurant]
  end

  def create
      @restaurant = Restaurant.find_by_id(params[:review][:id])
      if current_user.restaurants.include?(@restaurant)
        flash[:notice]='Do you own this restaurant? Have you left a review before? Just stop.'
        redirect_to '/restaurants/all'
      else
        User.create_review(@restaurant, @currentUser, review_params)
        redirect_to '/restaurants/all'
     end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
