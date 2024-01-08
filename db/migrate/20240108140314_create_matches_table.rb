class CreateMatchesTable < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.integer :player1
      t.integer :player2
      t.integer :player1_score
      t.integer :player2_score

      t.timestamps
    end
    add_foreign_key :matches, :players, column: :player1
    add_foreign_key :matches, :players, column: :player2
  end
end
