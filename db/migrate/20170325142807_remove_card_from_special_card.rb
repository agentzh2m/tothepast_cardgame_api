class RemoveCardFromSpecialCard < ActiveRecord::Migration[5.0]
  def change
    remove_column :special_cards, :cards_id, :integer
  end
end
