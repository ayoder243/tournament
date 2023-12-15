class AddpNameToPlayer < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :p_name, :string
  end
end
