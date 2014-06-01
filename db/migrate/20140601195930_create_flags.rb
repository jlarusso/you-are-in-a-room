class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.string  :name
      t.text    :active_text
      t.integer :player_id

      t.timestamps
    end
  end
end
