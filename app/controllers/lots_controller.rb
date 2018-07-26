class LotsController < ApplicationController
  before_action :set_tenant
  before_action :set_lot , only: [:show, :edit, :update, :destroy]

  def index
    @lots = Lot.current.where(tenant_id:params[:tenant_id]).order(created_at: :desc)
   @lots_kgs=@lots.sum(:kg) 
   @lots=@lots.to_a
   @daily_lots=@lots.group_by {|t| t.created_at.beginning_of_day}
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
    @pmu=@lot.purchase.pmu
    # @pmu=Pmu.find(params[:id])
    @hash = Gmaps4rails.build_markers(@pmu) do |pmu, marker|
      marker.lat pmu.latitude
      marker.lng pmu.longitude
    end
  end

   def cushow
    @pmu=@lot.purchase.pmu
    # @pmu=Pmu.find(params[:id])
    @hash = Gmaps4rails.build_markers(@pmu) do |pmu, marker|
      marker.lat pmu.latitude
      marker.lng pmu.longitude
    end
   end

  # GET /lots/new
  def new
    @lot = Lot.new
    @weighing=@lot.weighings.new
    @lot.tenant_id=@tenant.id
    @weighing.tenant_id=@tenant.id
  end

  # GET /lots/1/edit
  def edit
        @lot.tenant_id=@tenant.id
  end

  # POST /lots
  def create
    @lot = Lot.new(lot_params)
    @lot.tenant_id=@tenant.id
        @lot.weighings.each do |w|
          w.tenant_id = @tenant.id
        end
    respond_to do |format|
      if @lot.save
       # @lot.set_kg
        format.html { redirect_to tenant_lots_path(@tenant), notice: 'Lot was successfully created.' }
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
        @lot.tenant_id=params[:tenant_id]
        @lot.weighings.each do |w|
          w.tenant_id = params[:tenant_id]
        end
    respond_to do |format|
      if @lot.update(lot_params)
        format.html { redirect_to tenant_lots_path(@tenant,@lot), notice: 'Lot was successfully updated.' }
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
      format.html { redirect_to tenant_lots_path, notice: 'Lot was successfully destroyed.' }
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
     # params.require(:lot).permit(:lot,:kg,:plastics,:crates,:tenant_id,:purchase_id,:note,weighings_attributes:[:id,:tenant_id,:lot_id,:mixed_weight,:crates,:crate_weight,:palets,:palet_weight,:_destroy])
      params
      .require(:lot)
      .permit(:lot,:kg,:plastics,:crates,:tenant_id,:purchase_id,:note,weighings_attributes:[:id,:tenant_id,:lot_id,:mixed_weight,:crates,:crate_weight,:palets,:palet_weight,:_destroy])
      #Weighing.attribute_names.map(&:to_sym).push(:destroy))
    end

    def verify_tenant
    #   unless params[:tenant_id]==Tenant.current_tenant_id.to_s
    #     redirect_to :root ,
    #     flash:{error: 'You are not authorized to access any organization other than your own'}
    #   end
    end

   #  def purchase_default_to_seu_if_necessary
   # purchase_id = 122 if purchase_id.blank?
   #  end 

end
