class BannerFileObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(banner_file)
    Log.create(:table => "banner_file", :action => "create", :comments => "Novo arquivo de banner criado", :user => User.set_current_user, :rel => banner_file.id)
  end
  
  def before_update(banner_file)
    banner_file.changes.each do |key, values|
      Log.create(:table => "banner_file", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Arquivo de banner atualizado!", :user => User.set_current_user, :rel => banner_file.id)
    end
  end
end