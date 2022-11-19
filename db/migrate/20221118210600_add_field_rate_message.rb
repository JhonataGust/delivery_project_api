class AddFieldRateMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :rate, :integer, default: 0
  end
end
