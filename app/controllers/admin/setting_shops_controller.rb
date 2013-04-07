class Admin::SettingShopsController < ApplicationController
  # GET /setting_shops
  # GET /setting_shops.json
  before_filter :load_type_contacts
    
  
  def index
    @setting_shop = SettingShop.first
    if @setting_shop.nil?
      @setting_shop = SettingShop.new
      @setting_shop.setting_shop_contacts.build
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @setting_shop }
    end
  end


  # POST /setting_shops
  # POST /setting_shops.json
  def create
    @setting_shop = SettingShop.new(params[:setting_shop])

    respond_to do |format|
      if @setting_shop.save
        flash[:notice] = 'Setting shop was successfully created.'
      else
        flash[:error] = 'Setting shop was successfully created.'
      end
      format.html { redirect_to action: 'index'}
    end
  end

  # PUT /setting_shops/1
  # PUT /setting_shops/1.json
  def update
    @setting_shop = SettingShop.find(params[:id])
    respond_to do |format|
      if @setting_shop.update_attributes(params[:setting_shop])
        flash[:notice] = 'Setting shop was successfully created.'
      else
        flash[:error] = 'Setting shop was successfully created.'
      end
      format.html { redirect_to action: 'index'}
      
    end
  end
  
  def load_type_contacts
    @type_contacts = [['Residencial', 'H'], ['Celular', 'M'], ['Comercial', 'W']]
  end
end
