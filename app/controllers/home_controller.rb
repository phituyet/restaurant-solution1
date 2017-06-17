class HomeController < ApplicationController
  def menu
    @sections = Section.all
    @order_text = { 'price-asc': 'Price low to high', 'price-desc': 'Price high to low', 'view-desc': 'Most Viewed' }
    @cuisines = Cuisine.all
    @selected_cuisine = Cuisine.where(slug: params[:cuisine]).first

    order_query = { 'price-asc': "price ASC", 'price-desc': "price DESC" }

    # query
    if params[:section_id].present? || params[:s].present? || params[:cuisine].present?
      @food_items = FoodItem.in_section(params[:section_id]).search(params[:s]).cuisine(params[:cuisine]).custom_order(params[:order])
    else
      @food_items = FoodItem.all.custom_order(params[:order])
    end
  end

  def contact
  end

  def create_order
    @food_item = FoodItem.find(params[:id])
  end

  def thank_you
    @order = Order.find(params[:id])
  end
end
