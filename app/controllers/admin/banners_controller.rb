class Admin::BannersController < ApplicationController
  
  before_filter :validate_module
  
  def index
   @banner = Banner.first
    if @banner.nil?
      @banner = Banner.new
      @banner.banner_files.build
    end 
  end
  
  def create
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
        flash[:notice] = 'Banner salvo com sucesso.'
      else
        flash[:error] = 'Erro ao salvar o banner'
      end
      format.html { redirect_to action: 'index'}
    end
  end

  # PUT /setting_shops/1
  # PUT /setting_shops/1.json
  def update
    @banner = Banner.find(params[:id])
    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        flash[:notice] = 'Banner atualizado com sucesso.'
      else
        flash[:error] = 'Erro ao atualizar o banner.'
      end
      format.html { redirect_to action: 'index'}
      
    end
  end
  
private
  def validate_module
    module_ext = ModuleExtension.where(:tag_name => 'banners', :visible => 1).first
    if module_ext.nil?
      respond_to do |format|
        flash[:error] = 'Modulo nao disponivel para esse plano'
        format.html { redirect_to module_extensions_url }
      end
    end
  end

end