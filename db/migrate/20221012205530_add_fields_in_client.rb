class AddFieldsInClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :completed, :boolean, default: false
  end
end
