class LotsController < ApplicationController
  before_action :set_tenant
  before_action :set_lot, only: [:show, :edit, :update, :destroy]
  before_action :verify_tenant


  # GET /lots
  # GET /lots.json
  def index
    @lots = Lot.where(tenant_id:params[:tenant_id]).order(created_at: :desc)
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
  end

  # GET /lots/new
  def new
    @lot =Lot.create!
  end

  # GET /lots/1/edit
  def edit
        @lot.tenant_id=@tenant.id
  end

  # POST /lots
  # POST /lots.json
  def create
         # @tenant=Tenant.find(params[:tenant_id])
        # @lot=Lot.create
    @lot = Lot.new(lot_params)
        @lot.tenant_id=@tenant.id

    respond_to do |format|
      if @lot.save
        format.html { redirect_to tenant_lots_path, notice: 'Lot was successfully created.' }
        format.json { render :show, status: :created, location: @lot }
      else
        format.html { render :new }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lots/1
  # PATCH/PUT /lots/1.json
  def update
        @lot.tenant_id=@tenant.id
    respond_to do |format|
      if @lot.update(lot_params)
        format.html { redirect_to tenant_lots_path, notice: 'Lot was successfully updated.' }
        format.json { render :show, status: :ok, location: @lot }
      else
        format.html { render :edit }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    @lot.destroy
    respond_to do |format|
      format.html { redirect_to lots_url, notice: 'Lot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   def set_tenant
      @tenant=Tenant.find(params[:tenant_id])
   end
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      # params.fetch(:lot, {})
      params.require(:lot).permit(:lot,:kg,:plastics,:tenant_id,:purchase_id,:note)
    end

    def verify_tenant
      unless params[:tenant_id]==Tenant.current_tenant_id.to_s
        redirect_to :root ,
        flash:{error: 'You are not authorized to access any organization other than your own'}
      end
    end
end
