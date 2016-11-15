class RestaurantsController < ApplicationController

  def all
    @restaurants = Restaurant.all
  end

  def new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to '/restaurants/all'
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :description)
  end

end
