class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.string :document
      t.string :email
      t.boolean :status
      t.references :account
      

      t.timestamps
    end
    add_index :owners, :account_id
    
  end
end
