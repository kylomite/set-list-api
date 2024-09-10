# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Artist.create(name: "Prince")
Artist.create(name: "Run The Jewels")

Song.create!(title: 'Raspberry Beret', length: 345, play_count: 34, artist_id: 1)
Song.create!(title: 'Purple Rain', length: 524, play_count: 19, artist_id: 1)
Song.create!(title: 'Legend Has It', length: 2301, play_count: 2300000, artist_id: 2)