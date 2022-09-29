class AddEndSessionToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users , :session_till, :datetime
  end
end
