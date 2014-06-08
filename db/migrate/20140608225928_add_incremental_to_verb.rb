class AddIncrementalToVerb < ActiveRecord::Migration
  def change
    add_column :verbs, :incremental, :integer, default: 0
  end
end
