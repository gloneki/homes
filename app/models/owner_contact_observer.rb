class OwnerContactObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(owner_contact)
    Log.create(:table => "owner_contact", :action => "create", :comments => "Novo contato de proprietario criado", :user => User.set_current_user, :rel => owner_contact.id)
  end
  
  def before_update(owner_contact)
    owner_contact.changes.each do |key, values|
      Log.create(:table => "owner_contact", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Contato de proprietario atualizado!", :user => User.set_current_user, :rel => owner_contact.id)
    end
  end
end