class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :verify_account
  layout :layout_by_resource
  
  def verify_account
    unless current_user.nil?
      #Rails.logger.add_metadata({:user_id=>current_user.id, :email=>current_user.email}) if Rails.logger.respond_to?(:add_metadata)
      @account = Account.find_by_user_id(current_user.id)
      Account.create_new(current_user.id) if @account.nil?
      account_object = Account.first(:conditions=>{:user_id=>current_user.id})
      session[:account_id] = account_object.id
      session[:plan_name] = account_object.plan.name unless account_object.plan.nil?
      settings_shop = SettingShop.where(:account_id => session[:account_id]).first
      session[:shop_name] = settings_shop.name unless settings_shop.nil?
    end
  end
  
protected
  def layout_by_resource
    if devise_controller?
      "login_layout"
    else
      "application"
    end
  end

end
