class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    # @food_item = FoodItem.find(params[:food_item])

    foods = session[:cart].split(',')
    @food_items = FoodItem.in_array(foods)
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @food_items = FoodItem.in_array(params[:food_item_ids].to_a)

    # render :show

    respond_to do |format|
      result = false

      # calculate price
      # food_item = FoodItem.find(params[:food_item_id])
      @order.price = 0
      @food_items.each do |item|
        @order.price += item.price
      end
      @order.price += 20000 # delivery
      @order.price_total = @order.price

      # discount
      if params[:coupon].present? && params[:coupon] == 'CODERSCHOOL'
        @order.price_total *= 0.5
      end

      #save
      if params[:food_item_ids].present?
        Order.transaction do
          @order.save!
          @food_items.each do |item|
            @order.order_items.create({ food_item_id: item.id }).save!
          end
        end
        session[:cart] = ''
        format.html { redirect_to thank_you_path(id: @order.id), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end

      # if @order.save
      #   format.html { redirect_to @order, notice: 'Order was successfully created.' }
      #   format.json { render :show, status: :created, location: @order }
      # else
      #   format.html { render :new }
      #   format.json { render json: @order.errors, status: :unprocessable_entity }
      # end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :age, :phone, :email)
    end

    def food_item_params
      params.require(:order_item).permit(:food_item_id)
    end
end
