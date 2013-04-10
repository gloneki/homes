class Admin::OwnersController < ApplicationController
  # GET /owners
  # GET /owners.json
  before_filter :load_type_contacts
  
  def index
    @owners = Owner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @owners }
    end
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
    @owner = Owner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @owner }
    end
  end

  # GET /owners/new
  # GET /owners/new.json
  def new
    @owner = Owner.new
    @owner.build_owner_address
    @owner.owner_contacts.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @owner }
    end
  end

  # GET /owners/1/edit
  def edit
    @owner = Owner.find(params[:id])
  end

  # POST /owners
  # POST /owners.json
  def create
    params[:owner].merge!(:status => true)
    @owner = Owner.new(params[:owner])

    respond_to do |format|
      if @owner.save
        flash[:notice] = 'Proprietario criado com sucesso'
        format.html { redirect_to :action => 'show', :id => @owner.id}
        format.json { render json: @owner, status: :created, location: @owner }
      else
        format.html { render action: "new" }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /owners/1
  # PUT /owners/1.json
  def update
    @owner = Owner.find(params[:id])

    respond_to do |format|
      if @owner.update_attributes(params[:owner])
        flash[:notice] = 'Proprietario atualizado com sucesso'
        format.html { redirect_to :action => 'show', :id => @owner.id}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy

    respond_to do |format|
      format.html { redirect_to owners_url }
      format.json { head :no_content }
    end
  end

  def log
    logs = Log.all
    logs = Log.arel_table
    @logs = Log.where(logs[:table].eq("owner").or(logs[:table].eq("owner_address").or(logs[:table].eq("owner_contacts")).and(logs[:rel].eq(params[:id])))
 
    @owner = Owner.where(:id => params[:id]).first
  end
  
  def load_type_contacts
    @type_contacts = [['Residencial', 'H'], ['Celular', 'M'], ['Comercial', 'W']]
  end
end
