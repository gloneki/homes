class Home < ActiveRecord::Base
  belongs_to :account
  has_one :address
  belongs_to :type_home
  belongs_to :type_service
  belongs_to :owner
  accepts_nested_attributes_for :address, :allow_destroy => true
  attr_accessible :code, :description, :price, :type_home_id, :type_service_id, :address_attributes, :owner_id, :account_id, :status
  validates_presence_of :code, :price, :type_home_id, :type_service_id, :owner_id
  validates_uniqueness_of :code
end
  