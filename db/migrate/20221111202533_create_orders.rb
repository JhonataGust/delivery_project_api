class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.jsonb :extra_ids
      t.float :value

      t.timestamps
    end
    add_column :orders, :quantity, :integer
  end
end
