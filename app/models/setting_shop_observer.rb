class SettingShopObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(setting_shop)
    Log.create(:table => "setting_shop", :action => "create", :comments => "Nova configuracao de loja criada", :user => User.set_current_user, :rel => setting_shop.id)
  end
  
  def before_update(home)
    home.changes.each do |key, values|
      Log.create(:table => "setting_shop", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Configuracao de Loja atualizada!", :user => User.set_current_user, :rel => setting_shop.id)
    end
  end
end