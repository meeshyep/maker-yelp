class RestaurantsController < ApplicationController

  def all
    @restaurants = Restaurant.all
  end

  def new
  end
end
