class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.boolean :status
      t.references :user
      t.references :situation
      t.references :plan
      t.timestamps
    end
    add_index :accounts, :user_id
    add_index :accounts, :situation_id
    add_index :accounts, :plan_id
  end
end
