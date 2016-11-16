class ReviewController < ApplicationController
  before_action do
    @currentUser = current_user.id
  end

  def new
    @id = params[:restaurant]

  end

  def create
      @restaurant = Restaurant.find_by_id(params[:review][:id])
      if current_user.has_already_reviewed? @restaurant
        flash[:notice]='Have you left a review before? Just stop.'
        redirect_to '/restaurants/all'
      elsif @currentUser == @restaurant.user_id
        flash[:notice]='Is this your own restaurant? You cannot do that.'
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
