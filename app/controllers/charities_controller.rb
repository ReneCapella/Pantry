# app/controllers/travel_controller.rb
class CharitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @donated_items = FoodItem.active.where(food_item_status_id: 2, pantry_id: current_user.pantry.id)
  end
end
