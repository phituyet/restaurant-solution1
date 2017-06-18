class HomeController < ApplicationController
  def menu
    @sections = Section.all
    @order_text = { 'price-asc': 'Price low to high', 'price-desc': 'Price high to low', 'view-desc': 'Most Viewed' }
    @cuisines = Cuisine.all
    @selected_cuisine = Cuisine.where(slug: params[:cuisine]).first

    # @selected_params = params.select { |k, v| ['section_id', 'order', 's', 'cuisine'].include?(k) }
    @selected_params = params.permit(:section_id, :order, :s, :cuisine)

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

  def add_to_cart
    if params[:id]
      if session[:cart]
        carts = session[:cart].split(',')
      else 
        carts = []
      end
      carts.push(params[:id])
      session[:cart] = carts.join(',')

      redirect_to root_path, notice: 'You have put something in the cart'
    else
      redirect_to root_path
    end

  end

  def create_order
    @food_item = FoodItem.find(params[:id])
  end

  def thank_you
    @order = Order.find(params[:id])
  end
end
