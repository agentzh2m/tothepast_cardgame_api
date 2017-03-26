class FixCharacterSpellingInPlayer < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :characer
    add_column :players, :character, :string
  end
end
