class LoadingsController < ApplicationController
  before_action :set_loading, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant
  # GET /loadings
  # GET /loadings.json
  def index
    @loadings = Loading.all
  end

  # GET /loadings/1
  # GET /loadings/1.json
  def show
    @palets=@loading.palets.order(code: :desc)
  end

  # GET /loadings/new
  def new
    @loading = Loading.new
    @palets=Palet.where(loading_id:nil).order(code: :desc)
  end

  # GET /loadings/1/edit
  def edit

    @palets=@loading.palets
    @unloaded_palets=Palet.where(loading_id:nil)

  end

  # POST /loadings
  # POST /loadings.json
  def create
    @loading = Loading.new(loading_params)
    @loading.tenant_id=params[:tenant_id]

    respond_to do |format|
      if @loading.save
        format.html { redirect_to tenant_loadings_path, notice: 'Loading was successfully created.' }
        format.json { render :show, status: :created, location: @loading }
      else
        format.html { render :new }
        format.json { render json: @loading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loadings/1
  # PATCH/PUT /loadings/1.json
  def update
  
    respond_to do |format|
      if @loading.update(loading_params)
        format.html { redirect_to tenant_loadings_path, notice: 'Loading was successfully updated.' }
        format.json { render :show, status: :ok, location: @loading }
      else
        format.html { render :edit }
        format.json { render json: @loading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loadings/1
  # DELETE /loadings/1.json
  def destroy
    @loading.destroy
    respond_to do |format|
      format.html { redirect_to tenant_loadings_path, notice: 'Loading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loading
      @loading = Loading.find(params[:id])
    end

    def set_tenant
      @tenant=Tenant.find(params[:tenant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loading_params
      params.require(:loading).permit(:date, :customer, :eta, :delivered,:tenant_id,palet_ids:[])
    end
end
