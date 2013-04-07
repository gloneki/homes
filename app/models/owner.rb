class Owner < ActiveRecord::Base
  belongs_to :account
  has_one :owner_address
  has_many :owner_contacts
  attr_accessible :document, :name, :status, :owner_address_attributes, :email, :owner_contacts_attributes, :account_id, :status
  accepts_nested_attributes_for :owner_address
  accepts_nested_attributes_for :owner_contacts 
  validates_presence_of :name, :document, :email
end
