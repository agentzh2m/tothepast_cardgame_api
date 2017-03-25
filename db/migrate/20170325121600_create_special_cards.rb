class CreateSpecialCards < ActiveRecord::Migration[5.0]
  def change
    create_table :special_cards do |t|
      t.string :name
      t.text :description
      t.references :cards, foreign_key: true
      t.integer :cost

      t.timestamps
    end
  end
end
