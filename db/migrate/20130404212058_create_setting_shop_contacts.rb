class CreateSettingShopContacts < ActiveRecord::Migration
  def change
    create_table :setting_shop_contacts do |t|
      t.string :type_contact
      t.string :contact_value
      t.references :account
      t.references :setting_shop

      t.timestamps
    end
    add_index :setting_shop_contacts, :account_id
    add_index :setting_shop_contacts, :setting_shop_id
  end
end
