class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.integer :node_id
      t.integer :link_id

      t.timestamps
    end
  end
end
