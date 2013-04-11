class Admin::UsersController < ApplicationController
  def index
    @users = User.paginate(:per_page => 1, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'Usuario atualizado com sucesso.'
        format.html { redirect_to :action => 'index'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end
  
  def new
    @user = User.new
       
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
    
  end
  
  def create
    params[:user].merge!(:is_active => true)
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = 'Usuario criado com sucesso.'
        format.html { redirect_to :action => 'index'}
        
      else
        format.html { render action: "new" }
        
      end
    end

  end
  
  def inactive
    user = User.where(:id => params[:id]).first
    user.update_attribute(:is_active, 0)
    flash[:notice] = 'Usuario inativado com sucesso!'
    respond_to do |format|
      format.html { redirect_to admin_users_url }
    end
  end
  
  def active
    user = User.where(:id => params[:id]).first
    user.update_attribute(:is_active, 1)
    flash[:notice] = 'Usuario ativado com sucesso!'
    respond_to do |format|
      format.html { redirect_to admin_users_url }
    end
  end

  def log
    @logs = Log.where(:table => "user", :rel => params[:id])
     @user = User.where(:id => params[:id]).first
  end
  
end