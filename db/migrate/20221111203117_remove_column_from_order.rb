class RemoveColumnFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :extra_ids
    remove_column :orders, :quantity
    remove_column :orders, :product_id
  end
end
