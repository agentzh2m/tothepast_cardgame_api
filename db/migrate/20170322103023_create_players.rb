class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.references :user
      t.string :characer
      t.integer :gold
      t.boolean :isTurn

      t.timestamps
    end
  end
end
