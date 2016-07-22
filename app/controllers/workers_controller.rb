class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant

  def import
  Worker.import(params[:file])
  redirect_to tenant_workers_path(@tenant), notice: "Worker list  imported."
  end

  def index
    @workers = Worker.where(tenant_id:params[:tenant_id])
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
    @worker.tenant_id=@tenant.id

  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to tenant_workers_path, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to [@tenant,@worker], notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to tenant_workers_path, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end
    def set_tenant
      @tenant=Tenant.find(params[:tenant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:last_name, :mobile, :tenant_id, :course_id,:first_name,:age,:insurance,:age,:active)
    end
end
