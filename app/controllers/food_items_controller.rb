class FoodItemsController < ApplicationController
  def show
    @food_item = FoodItem.find(params[:id])
    if @food_item.view.is_a? Integer
      @food_item.view += 1
    else
      @food_item.view = 1
    end
    @food_item.save!
  end
end
