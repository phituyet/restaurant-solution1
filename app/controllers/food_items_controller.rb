class FoodItemsController < ApplicationController
  def show
    @food_item = FoodItem.find(params[:id])

    @food_item.view += 1

    @food_item.save!
    @average_rate = @food_item.reviews.average(:point)
    # review form
    @review = @food_item.reviews.build
  end

  # POST /create_review
  def create_review
    @review = Review.new(review_params)

    if @review.save
      redirect_to food_item_path(id: @review.food_item_id), notice: 'Thank you for giving reviews!' 
    else 
      render :show
    end
  end

  private
    def review_params
      params.require(:review).permit(:point, :name, :comment, :food_item_id)  
    end

end
