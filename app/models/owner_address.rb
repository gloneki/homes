class OwnerAddress < ActiveRecord::Base
  attr_accessible :city, :complement, :country, :neighborhood, :number, :postal_code, :state, :street
  belongs_to :owner
  validates_presence_of :city, :country, :neighborhood, :number, :postal_code, :state, :street
end
