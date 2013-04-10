class SettingShopContactObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(setting_shop_contact)
    Log.create(:table => "setting_shop_contact", :action => "create", :comments => "Novo contato de loja criada", :user => User.set_current_user, :rel => setting_shop_contact.id)
  end
  
  def before_update(owner_contact)
    setting_shop_contact.changes.each do |key, values|
      Log.create(:table => "setting_shop_contact", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Contato de loja atualizado!", :user => User.set_current_user, :rel => setting_shop_contact.id)
    end
  end
end