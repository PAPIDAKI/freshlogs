class PmusController < ApplicationController
  before_action :set_tenant 
  before_action :set_project
  before_action :set_pmu, only: [:show, :edit, :update, :destroy]
  # GET /pmus
  # GET /pmus.json
  def index
     # @tenant=Tenant.find(params[:tenant_id])
    # @project=Project.find(params[:project_id])
    @pmus = @project.pmus.all
  end

  # GET /pmus/1
  # GET /pmus/1.json
  def show
     # @tenant=Tenant.find(params[:tenant_id])
    # @project=Project.find(params[:project_id])
    @pmu=@project.pmus.find(params[:id])
  end

  # GET /pmus/new
  def new
    # @tenant=Tenant.find(params[:tenant_id])
    # @project=Project.find(params[:project_id])
    @pmu = @project.pmus.new
  end

  # GET /pmus/1/edit
  def edit
  end

  # POST /pmus
  # POST /pmus.json
  def create
    @pmu = Pmu.new(pmu_params)

    respond_to do |format|
      if @pmu.save
        format.html { redirect_to tenant_project_path(@tenant,@project), notice: 'Pmu was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pmus/1
  # PATCH/PUT /pmus/1.json
  def update
    respond_to do |format|
      if @pmu.update(pmu_params)
        format.html { redirect_to @pmu, notice: 'Pmu was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /pmus/1
  # DELETE /pmus/1.json
  def destroy
    @pmu.destroy
    respond_to do |format|
      format.html { redirect_to tenant_project_pmus_path , notice: 'Pmu was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
    @tenant=Tenant.find(params[:tenant_id])
    end

    def  set_project
      @project=Project.find(params[:project_id])
    end

    def set_pmu
      @pmu = Pmu.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def pmu_params
      params.require(:pmu).permit(:produce, :village, :location, :size, :plants, :production, :facilities, :certification, :project_id, :latitude, :longitude)
    end
end
