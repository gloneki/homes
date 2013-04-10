class Log < ActiveRecord::Base
  attr_accessible :action, :comments, :field, :new_value, :old_value, :table, :user, :rel
end
