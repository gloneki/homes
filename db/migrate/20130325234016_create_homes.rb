class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :code
      t.references :account
      t.references :type_home
      t.references :type_service
      t.references :owner
      t.string :description
      t.float :price
      t.boolean :status

      t.timestamps
    end
    add_index :homes, :account_id
    add_index :homes, :type_home_id
    add_index :homes, :type_service_id
    add_index :homes, :owner_id
  end
end
