class SettingShopContact < ActiveRecord::Base
  belongs_to :account
  belongs_to :setting_shop
  attr_accessible :contact_value, :type_contact
end
