# app/controllers/travel_controller.rb
class CharitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @donated_items = FoodItem.where(food_item_status_id: 2)
  end
end
