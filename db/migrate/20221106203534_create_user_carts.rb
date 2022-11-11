class CreateUserCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.jsonb :extra_ids

      t.timestamps
    end
  end
end
