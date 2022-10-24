class AddUidToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :uid, :string
    add_index  :clients, :uid
  end
end
