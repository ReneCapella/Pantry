module PantriesHelper

  def pantry_expiration_count(pantry_id)
    pantry = Pantry.find(pantry_id)
    count = 0
    pantry.food_items.each do |food_item|
        if Date.today >= food_item.batch.exp_date && Date.today
          count = count +1
        end
    end
    return count
  end

  def donatable_item_count(pantry_id)
    pantry = Pantry.find(pantry_id)
    count = 0
    pantry.food_items.each do |food_item|
        if Date.today < food_item.batch.exp_date && Date.today > food_item.batch.best_by
          count = count +1
        end
    end
    return count
  end
end
