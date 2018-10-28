class LotsController < ApplicationController
  before_action :set_tenant
  before_action :set_lot , only: [:show, :edit, :update, :destroy]

  def index
    @lots = Lot.includes(:weighings,:purchase).current.where(tenant_id:params[:tenant_id]).order(created_at: :desc)
   @lots=@lots.to_a
   @daily_lots=@lots.group_by {|t| t.created_at.beginning_of_day}
  
  @weighings = Weighing.includes(:lot).current.where(tenant_id:params[:tenant_id])
   @daily_weighings=@weighings.group_by{|w| w.created_at.beginning_of_day}
   @daily_weighings.to_a.sum{|w| w}
  end

  def show
    @pmu=@lot.purchase.pmu
    @hash = Gmaps4rails.build_markers(@pmu) do |pmu, marker|
      marker.lat pmu.latitude
      marker.lng pmu.longitude
    end
  end

   def cushow
    @pmu=@lot.purchase.pmu
    @hash = Gmaps4rails.build_markers(@pmu) do |pmu, marker|
      marker.lat pmu.latitude
      marker.lng pmu.longitude
    end
   end

  def new
    @lot = Lot.new
    @weighing=@lot.weighings.new
    @lot.tenant_id=@tenant.id
    @weighing.tenant_id=@tenant.id
  end

  def edit
        @lot.tenant_id=@tenant.id
  end

  def create
    @lot = Lot.new(lot_params)
    @lot.tenant_id=@tenant.id
        @lot.weighings.each do |w|
          w.tenant_id = @tenant.id
        end
        @lot.set_kg
        @lot.set_crates
    respond_to do |format|
      if @lot.save
        format.html { redirect_to tenant_lots_path(@tenant), notice: 'Lot was successfully created.' }
        format.json { render :show, status: :created, location: @lot }
      else
        format.html { render :new }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
        @lot.tenant_id=params[:tenant_id]
        @lot.weighings.each do |w|
          w.tenant_id = params[:tenant_id]
        end
    respond_to do |format|
      if @lot.update(lot_params)
        @lot.set_kg
        format.html { redirect_to tenant_lots_path(@tenant), notice: 'Lot was successfully updated.' }
        format.json { render :show, status: :ok, location: @lot }
      else
        format.html { render :edit }
        format.json { render json: @lot.errors, status: :unprocessable_entity }
      end
    end
  end

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
    def set_lot
      @lot = Lot.find(params[:id])
    end

    def lot_params
      params
      .require(:lot)
      .permit(:lot,:kg,:plastics,:crates,:tenant_id,:purchase_id,:note,weighings_attributes: [ :id,:tenant_id,:lot_id,:mixed_weight,:crates,:crate_weight,:palets,:palet_weight,:_destroy])
    end

    def verify_tenant
    end


end
