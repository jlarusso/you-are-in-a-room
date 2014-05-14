class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.integer :from_id
      t.integer :to_id
      t.string :name

      t.timestamps
    end
  end
end
