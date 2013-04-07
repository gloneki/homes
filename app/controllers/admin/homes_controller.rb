class Admin::HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
  before_filter :load_types, :load_owners
  
  def index
    
    @homes = Home.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @homes }
    end
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
    @home = Home.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @home }
    end
  end

  # GET /homes/new
  # GET /homes/new.json
  def new
    @home = Home.new
    @home.build_address
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @home }
    end
  end

  # GET /homes/1/edit
  def edit
    @home = Home.find(params[:id])
  end

  # POST /homes
  # POST /homes.json
  def create
    params[:home].merge!(:status => true)
    @home = Home.new(params[:home])

    respond_to do |format|
      if @home.save
        flash[:notice] = 'Imovel criado com sucesso'
        format.html { redirect_to :action => 'show', :id => @home.id}
        format.json { render json: @home, status: :created, location: @home }
      else
        format.html { render action: "new" }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /homes/1
  # PUT /homes/1.json
  def update
    @home = Home.find(params[:id])

    respond_to do |format|
      if @home.update_attributes(params[:home])
        flash[:notice] = 'Imovel atualizado com sucesso'
        format.html { redirect_to :action => 'show', :id => @home.id}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home = Home.find(params[:id])
    @home.destroy

    respond_to do |format|
      format.html { redirect_to admin_homes_url }
      format.json { head :no_content }
    end
  end
  
  def inactive
    home = Home.where(:id => params[:id], :account_id => session[:account_id]).first
    home.update_attribute(:status, 0)
    flash[:notice] = 'Imovel inativado com sucesso!'
    respond_to do |format|
      format.html { redirect_to admin_homes_url }
    end
  end
  
  def active
    home = Home.where(:id => params[:id], :account_id => session[:account_id]).first
    home.update_attribute(:status, 1)
    flash[:notice] = 'Imovel ativado com sucesso!'
    respond_to do |format|
      format.html { redirect_to admin_homes_url }
    end
  end
  
  def get_owner
    if params[:id]=="new"
      @owner = nil
    else
       @owner = Owner.where(:id => params[:id]).first
    end
    respond_to do |format|
      format.js 
    end
  end
private
  def load_types
    @type_services = TypeService.all.collect{|t|[t.name, t.id]}
    @type_homes = TypeHome.all.collect{|h|[h.name, h.id]}
    
  end
  
  def load_owners
    @owners = Owner.where(:account_id => session[:account_id])
  end
  

end