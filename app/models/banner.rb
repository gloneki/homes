class Banner < ActiveRecord::Base
  attr_accessible :name, :banner_files_attributes
  has_many :banner_files
  accepts_nested_attributes_for :banner_files
  
end
