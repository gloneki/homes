class HighlightFileObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(highlight_file)
    Log.create(:table => "highlight_file", :action => "create", :comments => "Novo arquivo destaque criado", :user => User.set_current_user, :rel => highlight_file.id)
  end
  
  def before_update(address)
    highlight_file.changes.each do |key, values|
      Log.create(:table => "highlight_file", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Arquivo destaque atualizado!", :user => User.set_current_user, :rel => highlight_file.id)
    end
  end
end