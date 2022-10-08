class AddColumnToAddres < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :district, :string
  end
end
