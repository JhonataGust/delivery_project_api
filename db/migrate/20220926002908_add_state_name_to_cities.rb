class AddStateNameToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :state_name, :string
  end
end
