class BannerObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(banner)
    Log.create(:table => "banner", :action => "create", :comments => "Novo banner criado", :user => User.set_current_user, :rel => banner.id)
  end
  
  def before_update(banner)
    banner.changes.each do |key, values|
      Log.create(:table => "banner", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Banner atualizado!", :user => User.set_current_user, :rel => banner.id)
    end
  end
end