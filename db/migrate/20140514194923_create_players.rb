class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :node_id

      t.timestamps
    end
  end
end
