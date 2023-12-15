class AddPreferredSyndicatesToPlayer < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :preferred_syndicates, :string
  end
end
