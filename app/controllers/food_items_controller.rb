class FoodItemsController < ApplicationController
  def show
    @food_item = FoodItem.find(params[:id])
  end
end
