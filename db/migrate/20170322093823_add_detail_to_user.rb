class AddDetailToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :text
    add_column :users, :status, :text
  end
end
