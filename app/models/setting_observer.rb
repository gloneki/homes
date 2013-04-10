class SettingObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(setting)
    Log.create(:table => "setting", :action => "create", :comments => "Novo configuracao de sitema criada", :user => User.set_current_user, :rel => setting.id)
  end
  
  def before_update(setting)
    setting.changes.each do |key, values|
      Log.create(:table => "setting", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Configuracao de sistema atualizada!", :user => User.set_current_user, :rel => setting.id)
    end
  end
end