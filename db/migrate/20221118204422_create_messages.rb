class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :users, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
    add_reference :messages, :reference, polymorphic: true, index: true
  end
end
