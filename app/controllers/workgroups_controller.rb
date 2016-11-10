class WorkgroupsController < ApplicationController
  before_action :set_workgroup, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant

  # GET /workgroups
  # GET /workgroups.json
  def index
    @workgroups = Workgroup.where(tenant_id:params[:tenant_id])
  end

  # GET /workgroups/1
  # GET /workgroups/1.json
  def show
    # @active_workers=Workers.where(tenant_id:)
  end

  # GET /workgroups/new
  def new
    @workgroup = Workgroup.new
    @active_workers=Worker.where(tenant_id:params[:tenant_id]).active
  end

  # GET /workgroups/1/edit
  def edit
    # @active_workers=@workgroup.workers
    @active_workers=Worker.where(tenant_id:params[:tenant_id]).workgroup_workers.where(worker_id:nil)

 
  end

  # POST /workgroups
  # POST /workgroups.json
  def create
    @workgroup = Workgroup.new(workgroup_params)
    @workgroup.tenant_id=params[:tenant_id]
    respond_to do |format|
      if @workgroup.save
        format.html { redirect_to tenant_workgroups_path, notice: 'Workgroup was successfully created.' }
        format.json { render :show, status: :created, location: @workgroup }
      else
        format.html { render :new }
        format.json { render json: @workgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workgroups/1
  # PATCH/PUT /workgroups/1.json
  def update
    respond_to do |format|
      if @workgroup.update(workgroup_params)
        format.html { redirect_to tenant_workgroup_path(@tenant,@workgroup), notice: 'Workgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @workgroup }
      else
        format.html { render :edit }
        format.json { render json: @workgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workgroups/1
  # DELETE /workgroups/1.json
  def destroy
    @workgroup.destroy
    respond_to do |format|
      format.html { redirect_to tenant_workgroups_url, notice: 'Workgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workgroup
      @workgroup = Workgroup.find(params[:id])
    end

    def set_tenant
      @tenant=Tenant.find(params[:tenant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workgroup_params
      params.require(:workgroup).permit(:tenant_id,:title ,worker_ids:[])
    end
end
