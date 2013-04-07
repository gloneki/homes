class Address < ActiveRecord::Base
  belongs_to :home
  attr_accessible :city, :complement, :country, :neighborhood, :number, :postal_code, :state, :street
  validates_presence_of :city, :country, :neighborhood, :number, :postal_code, :state, :street
end
