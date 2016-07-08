class PmusController < ApplicationController
  before_action :set_tenant 
  before_action :verify_tenant
  before_action :set_pmu, only: [:show, :edit, :update, :destroy]
  # GET /pmus
  # GET /pmus.json
  def index
    @pmus=Pmu.where(tenant_id:params[:tenant_id])
    
    @hash=Gmaps4rails.build_markers(@pmus) do |pmu,marker|
      marker.lat pmu.latitude
      marker.lng pmu.longitude
    end

  end

  # GET /pmus/1
  # GET /pmus/1.json
  def show
    @grower=Grower.find(params[:grower_id])
    @pmu=@grower.pmus.find(params[:id])
    @hash = Gmaps4rails.build_markers(@pmu) do |pmu, marker|
      marker.lat pmu.latitude
      marker.lng pmu.longitude
    end
  end

  # GET /pmus/new
  def new
     @tenant=Tenant.find(params[:tenant_id])
    @grower=@tenant.growers.find(params[:grower_id])
    @pmu = @grower.pmus.new
  end

  # GET /pmus/1/edit
  def edit
    @grower=@tenant.growers.find(params[:grower_id])
    @pmu=Pmu.find(params[:id])
    
  end

  # POST /pmus
  # POST /pmus.json
  def create
     @tenant=Tenant.find(params[:tenant_id])
    @grower=@tenant.growers.find(params[:grower_id])
    @pmu =@grower.pmus.create(pmu_params)
    @pmu.tenant_id=Tenant.find(params[:tenant_id]).id  
    respond_to do |format|
      if @pmu.save
        format.html { redirect_to tenant_grower_path(@tenant,@grower), notice: 'Pmu was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pmus/1
  # PATCH/PUT /pmus/1.json
  def update
    @grower=Grower.find(params[:grower_id])
    respond_to do |format|
      if @pmu.update(pmu_params)
        format.html { redirect_to tenant_grower_pmu_path(@tenant,@grower,@pmu), notice: 'Pmu was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /pmus/1
  # DELETE /pmus/1.json
  def destroy
    @grower=Grower.find(params[:grower_id])
    @pmu.destroy
    respond_to do |format|
      format.html { redirect_to tenant_grower_pmus_path(@tenant,@grower), notice: 'Pmu was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
    @tenant=Tenant.find(params[:tenant_id])
    end

    def set_pmu
      @pmu = Pmu.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def pmu_params
      params.require(:pmu).permit(:produce, :village, :location, :size, :plants, :production, :facilities, :certification,:tenant_id,:grower_id, :latitude, :longitude)
    end

    def verify_tenant
      unless params[:tenant_id]==Tenant.current_tenant_id.to_s
        redirect_to :root ,
        flash:{error: 'You are not authorized to access any organization other than your own'}
      end
    end
    
end
