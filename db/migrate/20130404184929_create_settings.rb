class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :description
      t.string :setting_value
      t.references :account
      t.string :setting_type
      t.integer :ref_id
      t.boolean :status
      t.timestamps
    end
    add_index :settings, :account_id
  end
end
