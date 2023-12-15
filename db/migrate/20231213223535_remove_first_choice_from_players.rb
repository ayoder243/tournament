class RemoveFirstChoiceFromPlayers < ActiveRecord::Migration[7.1]
  def change
    remove_column :players, :first_choice, :string
    remove_column :players, :second_choice, :string
    add_column :players, :second_choice, :integer
  end
end
