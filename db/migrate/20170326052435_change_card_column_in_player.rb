class ChangeCardColumnInPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column(:players, :card, :string, array: true, default: '{}' )
  end
end
