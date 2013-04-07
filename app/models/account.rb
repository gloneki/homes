class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :situation
  attr_accessible :status, :user_id, :situation_id
  belongs_to :plan  
  def self.create_new(user_id)
    @account = Account.new(:user_id=>user_id, :status=>0, :situation_id => 0)
    @account.save
  end
  
end
