class FoodItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_item, only: %i[ show edit update destroy ]

  # GET /food_items or /food_items.json
  def index
    @food_items = FoodItem.all
  end

  # GET /food_items/1 or /food_items/1.json
  def show
  end

  # GET /food_items/new
  def new
    @food_item = FoodItem.new
  end

  # GET /food_items/1/edit
  def edit
  end

  # POST /food_items or /food_items.json
  def create
    puts "!!!!!!!!!!!!!!!!!!!!"
    puts food_item_params
    order = Order.find(food_item_params["order_id"])
    pantry = Pantry.find()
    puts order.food_items
    # @food_item = FoodItem.new(food_item_params)
    if order
      order.transfer_ownership(food_item_params["pantry_id"])
    end

    respond_to do |format|
      if @food_item.save
        format.html { redirect_to food_item_url(@food_item), notice: "Food item was successfully created." }
        format.json { render :show, status: :created, location: @food_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_items/1 or /food_items/1.json
  def update
    respond_to do |format|
      if @food_item.update(food_item_params)
        format.html { redirect_to food_item_url(@food_item), notice: "Food item was successfully updated." }
        format.json { render :show, status: :ok, location: @food_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_items/1 or /food_items/1.json
  def destroy
    @food_item.destroy

    respond_to do |format|
      format.html { redirect_to food_items_url, notice: "Food item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_item_params
      params.fetch(:food_item, {}).permit(:name, :pantry_id, :order_id)
    end
end
