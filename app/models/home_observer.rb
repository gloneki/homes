class HomeObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(home)
    Log.create(:table => "home", :action => "create", :comments => "Novo imovel criado", :user => User.set_current_user, :rel => home.id)
  end
  
  def before_update(home)
    home.changes.each do |key, values|
      Log.create(:table => "home", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Imovel atualizado!", :user => User.set_current_user, :rel => home.id)
    end
  end
end