class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.text :street
      t.string :number
      t.text :complement

      t.timestamps
    end
  end
end
