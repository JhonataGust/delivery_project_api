class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :short_name
      t.float :company_relevance
      t.references :user, null: false, foreign_key: true
      t.string :number
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
