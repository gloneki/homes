class Admin::SettingsController < ApplicationController
  
  def index
    @settings = Setting.all  
  end
  
  def edit
    @setting = Setting.find(params[:id])
  end
  
  def update
    @setting = Setting.find(params[:id])

    respond_to do |format|
      if @setting.update_attributes(params[:setting])
        flash[:notice] = 'Configuracao atualizada com sucesso.'
        format.html { redirect_to action: 'index'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def log
    @logs = Log.where(:table => "setting", :rel => params[:id])
    @setting = Setting.where(:id => params[:id]).first
  end

  
end