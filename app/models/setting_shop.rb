class SettingShop < ActiveRecord::Base
  belongs_to :account
  has_many :setting_shop_contacts
  accepts_nested_attributes_for :setting_shop_contacts
  attr_accessible :city, :complement, :country, :document, :email, :hour_service, :localization, :logo, :name, :neighborhood, :number, :postal_code, :showcase, :social_contact, :state, :street, :setting_shop_contacts_attributes, :account_id
end
