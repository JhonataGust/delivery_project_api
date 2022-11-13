class AddExtraIdsInOrderRelationships < ActiveRecord::Migration[7.0]
  def change
    add_column :order_relationships, :extra_ids, :jsonb
  end
end
