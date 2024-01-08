class Match < ApplicationRecord
    has_many :players, foreign_key: :player1
    has_many :players, foreign_key: :player2
end
