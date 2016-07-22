class AttPerformancesController < ApplicationController
  before_action :set_att_performance, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant
  before_action :set_attendance

  # GET /att_performances
  # GET /att_performances.json
  def index
    @att_performances = AttPerformance.all
  end

  # GET /att_performances/1
  # GET /att_performances/1.json
  def show
  end

  # GET /att_performances/new
  def new
    @att_performance = AttPerformance.new
  end

  # GET /att_performances/1/edit
  def edit
  end

  # POST /att_performances
  # POST /att_performances.json
  def create
    @att_performance = AttPerformance.new(att_performance_params)

    respond_to do |format|
      if @att_performance.save
        format.html { redirect_to @att_performance, notice: 'Att performance was successfully created.' }
        format.json { render :show, status: :created, location: @att_performance }
      else
        format.html { render :new }
        format.json { render json: @att_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /att_performances/1
  # PATCH/PUT /att_performances/1.json
  def update
    respond_to do |format|
      if @att_performance.update(att_performance_params)
        format.html { redirect_to @att_performance, notice: 'Att performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @att_performance }
      else
        format.html { render :edit }
        format.json { render json: @att_performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /att_performances/1
  # DELETE /att_performances/1.json
  def destroy
    @att_performance.destroy
    respond_to do |format|
      format.html { redirect_to att_performances_url, notice: 'Att performance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tendant
      @tenant=Tenant.find(params[:tenant_id])
    end

    def set_attendance
     
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_att_performance
      @att_performance = AttPerformance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def att_performance_params
      params.require(:att_performance).permit(:attendance_id, :tenant_id, :work_position, :cartons_packed, :late_arrival, :early_leave)
    end
end
