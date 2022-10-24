class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :value
      t.float :promotion
      t.references :client, null: false, foreign_key: true
      t.timestamp :duration_estimation
      t.boolean :stock

      t.timestamps
    end
  end
end
