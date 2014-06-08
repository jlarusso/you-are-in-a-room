class AddVerbToNode < ActiveRecord::Migration
  def change
    add_column :verbs, :node_id, :integer
  end
end
