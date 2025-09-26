# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"
if Rails.env.development?
  Product.destroy_all
  20.times do
    Product.create!(
      name: Faker::Commerce.product_name,
      code: "#{Faker::Alphanumeric.alpha(number: 4).upcase}#{Faker::Number.number(digits: 4)}",
      price: Faker::Commerce.price(range: 0..100.0),
      inventory: rand(0..50)
    )
  end
else
  puts "Seeding skipped. Not in development environment."
end