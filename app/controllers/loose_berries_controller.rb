class LooseBerriesController < ApplicationController
  before_action :set_tenant
  before_action :set_loose_berry, only: [:show, :edit, :update, :destroy]

  # GET /loose_berries
  # GET /loose_berries.json
  def index
    @loose_berries = LooseBerry.where(tenant_id:params[:tenant_id]).order(created_at: :desc)
  end

  # GET /loose_berries/1
  # GET /loose_berries/1.json
  def show

  end

  # GET /loose_berries/new
  def new
    @loose_berry = LooseBerry.new
    @loose_berry.tenant_id=@tenant.id
  end

  # GET /loose_berries/1/edit
  def edit
  end

  # POST /loose_berries
  # POST /loose_berries.json
  def create
    @loose_berry = LooseBerry.new(loose_berry_params)

    respond_to do |format|
      if @loose_berry.save
        format.html { redirect_to tenant_loose_berries_path, notice: 'Loose berry was successfully created.' }
        format.json { render :show, status: :created, location: @loose_berry }
      else
        format.html { render :new }
        format.json { render json: @loose_berry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loose_berries/1
  # PATCH/PUT /loose_berries/1.json
  def update
    respond_to do |format|
      if @loose_berry.update(loose_berry_params)
        format.html { redirect_to tenant_loose_berries_path , notice: 'Loose berry was successfully updated.' }
        format.json { render :show, status: :ok, location: @loose_berry }
      else
        format.html { render :edit }
        format.json { render json: @loose_berry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loose_berries/1
  # DELETE /loose_berries/1.json
  def destroy
    @loose_berry.destroy
    respond_to do |format|
      format.html { redirect_to tenant_loose_berries_path, notice: 'Loose berry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant=Tenant.find(params[:tenant_id])
    end
    def set_loose_berry
      @loose_berry = LooseBerry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loose_berry_params
      params.require(:loose_berry).permit(:purchase_id, :tenant_id, :kg, :note)
    end
end
