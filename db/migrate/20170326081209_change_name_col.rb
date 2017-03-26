class ChangeNameCol < ActiveRecord::Migration[5.0]
  def change
    remove_column :players, :character
    add_column :players, :character_name, :string
  end
end
