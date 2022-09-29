class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :phone
      t.integer :level_account
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
