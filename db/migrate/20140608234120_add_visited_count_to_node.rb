class AddVisitedCountToNode < ActiveRecord::Migration
  def change
    add_column :nodes, :visited_count, :integer, default: 0
  end
end
