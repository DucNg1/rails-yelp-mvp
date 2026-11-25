# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants..."
restaurants = [
  { name: "Dragon Palace", address: "12 Rue de la Paix, Paris", phone_number: "+33 1 42 00 11 22", category: "chinese" },
  { name: "Trattoria Roma", address: "5 Via Appia, Rome", phone_number: "+39 06 1234 5678", category: "italian" },
  { name: "Sakura Sushi", address: "3-1 Shibuya, Tokyo", phone_number: "+81 3 1234 5678", category: "japanese" },
  { name: "Le Petit Bistro", address: "28 Rue Oberkampf, Paris", phone_number: "+33 1 43 55 66 77", category: "french" },
  { name: "Chez Léon", address: "18 Rue des Bouchers, Brussels", phone_number: "+32 2 511 1415", category: "belgian" }
]

restaurants.each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end

puts "Finished! Created #{Restaurant.count} restaurants."
