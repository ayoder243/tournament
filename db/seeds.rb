# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Player.delete_all
Syndicate.delete_all
[["Adamant Hands", 1], ["Curators Maxima", 2], ["Song of the Chain", 3], ["Sentinels of Eternity", 4], ["Guardians of the Source", 5]].each do |syndicate|
    Syndicate.find_or_create_by!(s_name: syndicate[0], s_wins: 0, id:syndicate[1])
end