class AffiliateObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(affiliate)
    Log.create(:table => "affiliate", :action => "create", :comments => "Novo parceiro criado", :user => User.set_current_user, :rel => affiliate.id)
  end
  
  def before_update(affiliate)
    affiliate.changes.each do |key, values|
      Log.create(:table => "affiliate", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Parceiro atualizado!", :user => User.set_current_user, :rel => affiliate.id)
    end
  end
end