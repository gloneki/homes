class OwnerContact < ActiveRecord::Base
  belongs_to :owner
  attr_accessible :contact_value, :type_contact
  validates_presence_of :contact_value, :type_contact
end
