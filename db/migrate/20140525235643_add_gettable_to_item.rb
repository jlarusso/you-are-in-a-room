class AddGettableToItem < ActiveRecord::Migration
  def change
    add_column :items, :gettable, :boolean
  end
end
