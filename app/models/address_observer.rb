class AddressObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(address)
    Log.create(:table => "address", :action => "create", :comments => "Novo endereco imovel criado", :user => User.set_current_user, :rel => address.home.id)
  end
  
  def before_update(address)
    address.changes.each do |key, values|
      Log.create(:table => "address", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Endereco imovel atualizado!", :user => User.set_current_user, :rel => address.home.id)
    end
  end
end