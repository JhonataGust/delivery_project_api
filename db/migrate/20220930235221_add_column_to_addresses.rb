class AddColumnToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :city
  end
end
