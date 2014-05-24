class AddSurroundingsToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :surroundings, :text
  end
end
