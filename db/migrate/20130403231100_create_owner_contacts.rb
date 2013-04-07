class CreateOwnerContacts < ActiveRecord::Migration
  def change
    create_table :owner_contacts do |t|
      t.string :type_contact
      t.string :contact_value
      t.references :owner

      t.timestamps
    end
    add_index :owner_contacts, :owner_id
  end
end
