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
Match.delete_all
Syndicate.delete_all
[["Adamant Hands", 1], ["Curators Maxima", 2], ["Song of the Chain", 3], ["Sentinels of Eternity", 4], ["Guardians of the Source", 5]].each do |syndicate|
    Syndicate.find_or_create_by!(s_name: syndicate[0], s_wins: 0, id:syndicate[1])
end

require 'csv'

CSV.foreach(Rails.root.join('/home/parallels/odin/tournament/db/players_seed.csv'), headers: true) do |player|
    Player.create( 
        email: player["email"],
        password: "test123",
        password_confirmation: "test123",
        p_name: player["p_name"],
        syndicate: player["syndicate"]
    )
end

CSV.foreach(Rails.root.join('/home/parallels/odin/tournament/db/matches_seed.csv'), headers: true) do |match|
    Match.create( 
        player1: match["player1"],
        player2: match["player2"],
        player1_score: match["player1_score"],
        player2_score: match["player2_score"],
    )
end