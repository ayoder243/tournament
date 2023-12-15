class AddSyndicateToPLayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :syndicate, :string
    remove_column :players, :second_choice, :integer
    add_column :players, :second_choice, :string
  end
end
