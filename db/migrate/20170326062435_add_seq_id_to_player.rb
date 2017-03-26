class AddSeqIdToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :seqid, :integer
    add_column :rooms, :turn_counter, :integer 
  end
end
