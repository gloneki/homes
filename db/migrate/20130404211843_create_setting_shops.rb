class CreateSettingShops < ActiveRecord::Migration
  def change
    create_table :setting_shops do |t|
      t.string :name
      t.string :email
      t.string :document
      t.string :country
      t.string :state
      t.string :postal_code
      t.string :city
      t.string :neighborhood
      t.string :street
      t.string :number
      t.string :complement
      t.string :logo
      t.string :showcase
      t.text :hour_service
      t.string :localization
      t.string :social_contact
      t.references :account

      t.timestamps
    end
    add_index :setting_shops, :account_id
  end
end
