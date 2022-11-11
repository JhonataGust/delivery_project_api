class AddStatusOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :status, :integer
    add_column :orders, :accepted, :boolean, default: false
  end
end
