class RemoveName < ActiveRecord::Migration[7.1]
  def change
    remove_column :players, :second_choice, :integer
    add_column :players, :second_choice, :string
  end
end
