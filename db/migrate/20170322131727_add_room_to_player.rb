class AddRoomToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :room, foreign_key: true
  end
end
