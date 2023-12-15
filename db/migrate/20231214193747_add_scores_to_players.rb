class AddScoresToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :p_wins, :integer, default: 0
    add_column :players, :s_wins, :integer, default: 0
  end
end
