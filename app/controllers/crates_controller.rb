class CratesController < ApplicationController
  before_action :set_tenant
  before_action :set_crate, only: [:show, :edit, :update, :destroy]
  # GET /crates
  # GET /crates.json
  def index
    @crates = Crate.all
  end

  # GET /crates/1
  # GET /crates/1.json
  def show
    @tenant=Tenant.find(params[:tenant_id])
  end

  # GET /crates/new
  def new
    @crate = Crate.new
    @crate.tenant_id=params[:tenant_id]
  end

  # GET /crates/1/edit
  def edit
  end

  # POST /crates
  # POST /crates.json
  def create
    @crate = Crate.new(crate_params)

    respond_to do |format|
      if @crate.save
        format.html { redirect_to tenant_crate_path(@tenant,@crate), notice: 'Crate was successfully created.' }
        format.json { render :show, status: :created, location: @crate }
      else
        format.html { render :new }
        format.json { render json: @crate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crates/1
  # PATCH/PUT /crates/1.json
  def update
    respond_to do |format|
      if @crate.update(crate_params)
        format.html { redirect_to tenant_crate_path(@tenant,@crate), notice: 'Crate was successfully updated.' }
        format.json { render :show, status: :ok, location: @crate }
      else
        format.html { render :edit }
        format.json { render json: @crate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crates/1
  # DELETE /crates/1.json
  def destroy
    @crate.destroy
    respond_to do |format|
      format.html { redirect_to tenant_crates_url, notice: 'Crate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tenant
      @tenant=Tenant.find(params[:tenant_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_crate
      @crate = Crate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crate_params
      params.require(:crate).permit(:tenant_id, :driver_id, :from_pmu_id, :to_pmu_id, :crates, :note)
    end
end
