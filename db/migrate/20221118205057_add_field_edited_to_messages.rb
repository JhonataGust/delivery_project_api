class AddFieldEditedToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :edited, :boolean
  end
end
