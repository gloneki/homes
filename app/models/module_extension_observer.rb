class ModuleExtensionObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(module_extension)
    Log.create(:table => "module_extension", :action => "create", :comments => "Novo modulo criado", :user => User.set_current_user, :rel => module_extension.id)
  end
  
  def before_update(module_extension)
    module_extension.changes.each do |key, values|
      Log.create(:table => "module_extension", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Modulo atualizado!", :user => User.set_current_user, :rel => module_extension.id)
    end
  end
end