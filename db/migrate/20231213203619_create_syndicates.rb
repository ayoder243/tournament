class CreateSyndicates < ActiveRecord::Migration[7.1]
  def change
    create_table :syndicates do |t|
      t.string :s_name
      t.integer :s_wins

      t.timestamps
    end
  end
end
