class Admin::HighlightsController < ApplicationController
  
  before_filter :validate_module
  
  def index
   @highlight = Highlight.first
    if @highlight.nil?
      @highlight = Highlight.new
      @highlight.highlight_files.build
    end 
  end
  
  def create
    @highlight = Highlight.new(params[:highlight])

    respond_to do |format|
      if @highlight.save
        flash[:notice] = 'Destaque salvo com sucesso.'
      else
        flash[:error] = 'Erro ao salvar o destaque'
      end
      format.html { redirect_to action: 'index'}
    end
  end

  # PUT /setting_shops/1
  # PUT /setting_shops/1.json
  def update
    @highlight = Highlight.find(params[:id])
    respond_to do |format|
      if @highlight.update_attributes(params[:highlight])
        flash[:notice] = 'Destaque atualizado com sucesso.'
      else
        flash[:error] = 'Erro ao atualizar o destaque.'
      end
      format.html { redirect_to action: 'index'}
      
    end
  end
  
  def log
    logs = Log.all
    logs = Log.arel_table
    @logs = Log.where(logs[:table].eq("highlight").
                      or(logs[:table].eq("highlight_file")))
 
    @highlight = Highlight.where(:id => params[:id]).first
  end
  
private
  def validate_module
    module_ext = ModuleExtension.where(:tag_name => 'highlights', :visible => 1).first
    if module_ext.nil?
      respond_to do |format|
        flash[:error] = 'Modulo nao disponivel para esse plano'
        format.html { redirect_to module_extensions_url }
      end
    end
  end

    

end
