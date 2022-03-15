# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#create a basic user
basic_user = User.find_by(email: "basic@test.com")
if !basic_user
  basic_user = User.create!(email: "basic@test.com", password: "tester", role: 0)
end

#create an admin user
admin_user = User.find_by(email: "admin@test.com")
if !admin_user
  admin_user = User.create!(email: "admin@test.com", password: "tester", role: 1)
end

#create a producer user
producer_user = User.find_by(email: "producer@test.com")
if !producer_user
  producer_user = User.create!(email: "producer@test.com", password: "tester", role: 2)
end

#create a store user

store_user = User.find_by(email: "store@test.com")
if !store_user
  store_user = User.create!(email: "store@test.com", password: "tester", role: 3)
end

# create a producer
producer = Producer.create_or_find_by(name: "Sample Producer")

# create a store
store = Store.create_or_find_by(name: "Sample Store")

#create a batch that's all good
batch_good = Batch.create_or_find_by(producer_id: producer.id, store_id: store.id, item_name: "orange", best_by: DateTime.new(2026, 6, 2),
                    exp_date: DateTime.new(2026, 7, 31), recall: false)

#create a batch past best by
batch_past_best_by = Batch.create_or_find_by(producer_id: producer.id, store_id: store.id, item_name: "apple", best_by: DateTime.new(2022, 2, 2),
                    exp_date: DateTime.new(2022, 3, 31), recall: false)

#create a batch all bad
batch_bad = Batch.create_or_find_by(producer_id: producer.id, store_id: store.id, item_name: "banana", best_by: DateTime.new(2022, 2, 2),
                    exp_date: DateTime.new(2022, 2, 5), recall: false)

#create a batch recalled
batch_bad = Batch.create_or_find_by(producer_id: producer.id, store_id: store.id, item_name: "banana", best_by: DateTime.new(2027, 2, 2),
                    exp_date: DateTime.new(2029, 2, 5), recall: true)

# create a Pantry
pantry = basic_user.pantries.create()

#create a food item
FoodItem.create(name: "Apple", pantry_id: pantry.id)
