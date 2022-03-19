class FoodItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_item, only: %i[ show edit update donate ]

  # GET /food_items or /food_items.json
  def index
    @non_donated_food_items = FoodItem.where(donated: false)
    @marked_for_donation = FoodItem.where(donated: true)

  end

  # GET /food_items/1 or /food_items/1.json
  def show
  end

  # GET /food_items/new
  def new
    if params["format"]
      @pantry = Pantry.find(params["format"])
    end
    @food_item = FoodItem.new
  end

  # GET /food_items/1/edit
  def edit
  end

  # POST /food_items or /food_items.json
  def create
    #TODO this really isn't correct: users are not creating new food items: this should be an update
    order = Order.find(food_item_params["order_id"])
    if order
      order.transfer_ownership(food_item_params["pantry_id"])
    end

    respond_to do |format|
        format.html { redirect_to pantry_path(food_item_params["pantry_id"]), notice: "Food item was successfully transfered." }
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

  def donate
    #update the donated column on food item
    #@food_item.update(donated: true)
  end

  # DELETE /food_items/1 or /food_items/1.json
  def destroy

    @food_item = FoodItem.find(params[:id])
    pantry_id = @food_item.pantry_id
    @food_item.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: pantry_path(pantry_id) }
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
