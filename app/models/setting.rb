class Setting < ActiveRecord::Base
  belongs_to :account_id
  attr_accessible :description, :name, :ref_id, :setting_type, :setting_value
end
