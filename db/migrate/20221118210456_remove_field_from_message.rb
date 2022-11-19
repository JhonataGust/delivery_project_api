class RemoveFieldFromMessage < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :users_id
    add_reference :messages, :user
  end
end
