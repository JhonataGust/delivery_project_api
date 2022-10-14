class AddFieldsInClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :open, :string
    add_column :clients, :close, :string
    add_column :clients, :contact, :string
  end
end
