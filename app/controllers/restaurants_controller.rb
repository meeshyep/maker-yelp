class RestaurantsController < ApplicationController

  def all
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
    # @restaurant = Restaurant.find(params[:id])
    #
    # if @restaurant.update_attributes(params[:])

  end

  def method_name

  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :location)
  end

end
