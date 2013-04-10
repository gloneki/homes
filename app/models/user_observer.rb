class UserObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(user)
    Log.create(:table => "user", :action => "create", :comments => "Novo usuario criado", :user => User.set_current_user, :rel => user.id)
  end
  
  def before_update(user)
    user.changes.each do |key, values|
      Log.create(:table => "user", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Usuario atualizado!", :user => User.set_current_user, :rel => user.id)
    end
  end
end