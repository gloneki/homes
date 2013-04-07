class Admin::AffiliatesController < ApplicationController
  
  before_filter :validate_module
  
  def index
    
    @affiliates = Affiliate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliates }
    end
  end

  
  def show
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate }
    end
  end

  
  def new
    @affiliate = Affiliate.new
        
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliate }
    end
  end

  
  def edit
    @affiliate = Affiliate.find(params[:id])
  end

  
  def create
    params[:affiliate].merge!(:status => true)
    @affiliate = Affiliate.new(params[:affiliate])

    respond_to do |format|
      if @affiliate.save
        flash[:notice] = 'Parceiro criado com sucesso.'
        format.html { redirect_to :action => 'show', :id => @affiliate.id}
        format.json { render json: @affiliate, status: :created, location: @affiliate }
      else
        format.html { render action: "new" }
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      if @affiliate.update_attributes(params[:affiliate])
        flash[:notice] = 'Parceiro atualizado com sucesso.'
        format.html { redirect_to :action => 'show', :id => @affiliate.id}
        
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def inactive
    affiliate = Affiliate.where(:id => params[:id]).first
    affiliate.update_attribute(:status, 0)
    flash[:notice] = 'Parceiro inativado com sucesso!'
    respond_to do |format|
      format.html { redirect_to admin_affiliates_url }
    end
  end
  
  def active
    affiliate = Affiliate.where(:id => params[:id]).first
    affiliate.update_attribute(:status, 1)
    flash[:notice] = 'Parceiro ativado com sucesso!'
    respond_to do |format|
      format.html { redirect_to admin_affiliates_url }
    end
  end
  
private
  def validate_module
    module_ext = ModuleExtension.where(:tag_name => 'affiliates', :visible => 1).first
    if module_ext.nil?
      respond_to do |format|
        flash[:error] = 'Modulo nao disponivel para esse plano'
        format.html { redirect_to module_extensions_url }
      end
    end
  end
  
end
