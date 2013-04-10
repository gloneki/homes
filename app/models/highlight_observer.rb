class HighlightObserver < ActiveRecord::Observer
  cattr_accessor :set_current_user
  def after_create(highlight)
    Log.create(:table => "highlight", :action => "create", :comments => "Novo destaque criado", :user => User.set_current_user, :rel => highlight.id)
  end
  
  def before_update(highlight)
    highlight.changes.each do |key, values|
      Log.create(:table => "highlight", :action => "update", :field => key, :old_value => values.first,
        :new_value => values.last,  :comments => "Destaque atualizado!", :user => User.set_current_user, :rel => highlight.id)
    end
  end
end