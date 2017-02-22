class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :account_id
      t.float :balance
      t.string :status
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :accounts, :users
  end
end
