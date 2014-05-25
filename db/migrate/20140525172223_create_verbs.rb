class CreateVerbs < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.string  :name
      t.string  :action
      t.text    :output_text
      t.integer :item_id

      t.timestamps
    end
  end
end
