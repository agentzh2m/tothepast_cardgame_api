class RemoveImageFromCard < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :image, :text
    add_column :cards, :description, :text
  end
end
