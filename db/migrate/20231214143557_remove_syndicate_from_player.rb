class RemoveSyndicateFromPlayer < ActiveRecord::Migration[7.1]
  def change
    remove_column :players, :syndicate, :string
  end
end
