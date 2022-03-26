class Batch < ApplicationRecord
  belongs_to :producer
  has_many :food_items

  after_update :food_recall

  def food_recall
    if self.recall

      self.food_items.each do |food_item|
        old_name = food_item.name
        food_item.update!(name: '!!RECALLED!! ' + old_name)
      end
    end
  end
end
