class AddSyndicateToPlayer < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :second_choice, :string
    remove_column :players, :preferred_syndicates, :string
    add_column :players, :first_choice, :string
  end
end
