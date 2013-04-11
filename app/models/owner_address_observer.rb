class OwnerAddressObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(owner_address)
    Log.create(:table => "owner_address", :action => "create", :comments => "Novo endereco de proprietario criado", :user => User.set_current_user, :rel=> owner_address.owner.id)
  end
  
  def before_update(owner_address)
    owner_address.changes.each do |key, values|
      Log.create(:table => "owner_address", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Endereco de proprietario atualizado!", :user => User.set_current_user, :rel=> owner_address.owner.id)
    end
  end
end