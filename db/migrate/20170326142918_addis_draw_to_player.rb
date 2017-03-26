class AddisDrawToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :is_draw, :boolean
  end
end
