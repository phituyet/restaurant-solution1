class HomeController < ApplicationController
  def menu
    @sections = Section.all
    @order_text = { 'price-asc': 'Price low to high', 'price-desc': 'Price high to low' }

    order_query = { 'price-asc': "price ASC", 'price-desc': "price DESC" }

    # decide order
    # if params[:order].present?
    #   query = FoodItem.order(order_query[params[:order].to_sym])
    # else 
    #   query = FoodItem.order(name: :asc)
    # end

    # query
    if params[:section_id].present? || params[:s].present?
      @food_items = FoodItem.in_section(params[:section_id]).search(params[:s]).custom_order(params[:order])
    else
      @food_items = FoodItem.all.custom_order(params[:order])
    end

    # @food_items = FoodItem.filter(params)



  end

  def contact
  end

  def section
    @section = Section.find(params[:id])
  end
end
