class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    if !user_signed_in?
      redirect_to '/restaurants/all'
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    @restaurant.save
    redirect_to '/restaurants/all'
  end

  def account
    @restaurants = Restaurant.where(user_id: current_user.id)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes!(restaurant_params)
      flash[:notice] = "Your restaurant has been updated."
      redirect_to(action: 'account')
    else
      flash[:notice] = "Your restaurant failed to update. Please try again."
      redirect_to(action: 'edit')
    end
  end

  def delete
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    @restaurant = Restaurant.find(params[:id]).destroy
    # flash[:notice] = "This restaurant has been deleted."
    redirect_to(action: 'restaurants')
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :location)
  end

end
