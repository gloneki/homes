class Highlight < ActiveRecord::Base
  attr_accessible :name, :highlight_files_attributes
  has_many :highlight_files
  accepts_nested_attributes_for :highlight_files
 
end
