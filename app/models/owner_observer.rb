class OwnerObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(owner)
    Log.create(:table => "owner", :action => "create", :comments => "Novo proprietario criado", :user => User.set_current_user, :rel => owner.id)
  end
  
  def before_update(owner)
    owner.changes.each do |key, values|
      Log.create(:table => "owner", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Proprietario atualizado!", :user => User.set_current_user, :rel => owner.id)
    end
  end
end