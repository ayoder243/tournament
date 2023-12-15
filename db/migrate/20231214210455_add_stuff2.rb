class AddStuff2 < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :admin, :bool, default: false
  end
end
