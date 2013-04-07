class Admin::ModuleExtensionsController < ApplicationController
  
  def index
    @modules = ModuleExtension.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @owners }
    end
  end
  
  def inactive
    modules_extension = ModuleExtension.where(:id => params[:id]).first
    modules_extension.update_attribute(:status, 0)
    flash[:notice] = 'Modulo inativado com sucesso!'
    respond_to do |format|
      format.html { redirect_to admin_module_extensions_url }
    end
  end
  
  def active
    modules_extension = ModuleExtension.where(:id => params[:id]).first
    modules_extension.update_attribute(:status, 1)
    flash[:notice] = 'Modulo ativado com sucesso!'
    respond_to do |format|
      format.html { redirect_to admin_module_extensions_url }
    end
  end
  
  def set_config
    modules_extension = ModuleExtension.where(:id => params[:id]).first
    if modules_extension.nil?
      action_name = 'module_extensions'
    else
      action_name = modules_extension.tag_name
    end
    respond_to do |format|
      format.html { redirect_to :controller=> action_name, :action => 'index' }
    end
  end
  
end
