# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

customers = FactoryBot.create_list(:customer, 10)
subscriptions = FactoryBot.create_list(:subscription, 3)

customers[1..9].each do |customer|
	CustomerSubscription.create(customer: customer, subscription: subscriptions[0])
end

subscriptions.each do |subscription|
	CustomerSubscription.create(customer: customers[0], subscription: subscription)
end