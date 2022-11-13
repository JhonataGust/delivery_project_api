class AddFiedltoOrderRelationships < ActiveRecord::Migration[7.0]
  def change
    add_column :order_relationships, status, :integer, default: 0
    add_column :order_relationships, accepted, :boolean
    add_reference :order_relationships, :client
  end
end
