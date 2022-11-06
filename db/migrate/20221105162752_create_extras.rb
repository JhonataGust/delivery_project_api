class CreateExtras < ActiveRecord::Migration[7.0]
  def change
    create_table :extras do |t|
      t.string :name
      t.references :product, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
