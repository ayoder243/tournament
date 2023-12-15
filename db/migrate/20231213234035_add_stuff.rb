class AddStuff < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :syndicate, :string
  end
end
