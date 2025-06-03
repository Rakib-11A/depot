class DropCartsAndLineItems < ActiveRecord::Migration[7.0]
  def change
    drop_table :carts, if_exists: true
    drop_table :line_items, if_exists: true
  end
end
