class ShiftListsController < ApplicationController
  before_action :set_shift_list, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant
  before_action :set_course
  # GET /shift_lists
  # GET /shift_lists.json
  def index
    # @shift_lists = ShiftList.where(tenant_id:params[:tenant_id])
    @shift_lists=ShiftList.where(course_id:params[:course_id]).order(start_at: :DESC)
  end

  # GET /shift_lists/1
  # GET /shift_lists/1.json
  def show
    @attendances=Attendance.where(shift_list_id:params[:id ])
  end

  # GET /shift_lists/new
  def new
    @course=Course.find(params[:course_id])
    @shift_list = @course.shift_lists.new
     @workers=@course.workers
     @shift_list.attendances = @course.worker_ids.map do |worker_id|
      @shift_list.attendances.build(worker_id: worker_id)
    end
  end

  # GET /shift_lists/1/edit
  def edit
  end

  # POST /shift_lists
  # POST /shift_lists.json
  def create
    @shift_list = @course.shift_lists.new(shift_list_params)
    @shift_list.tenant_id=params[:tenant_id]


    respond_to do |format|
      if @shift_list.save
        format.html { redirect_to tenant_course_shift_list_path(@tenant,@course,@shift_list), notice: 'Shift list was successfully created.' }
        format.json { render :show, status: :created, location: @shift_list }
      else
        format.html { render :new }
        format.json { render json: @shift_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shift_lists/1
  # PATCH/PUT /shift_lists/1.json
  def update
    respond_to do |format|
      if @shift_list.update(shift_list_params)
        format.html { redirect_to tenant_course_shift_list_path(@tenant,@course,@shift_list), notice: 'Shift list was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift_list }
      else
        format.html { render :edit }
        format.json { render json: @shift_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shift_lists/1
  # DELETE /shift_lists/1.json
  def destroy
    @shift_list.destroy
    respond_to do |format|
      format.html { redirect_to tenant_course_shift_lists_path(@tenant,@course), notice: 'Shift list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_list
      @shift_list = ShiftList.find(params[:id])
    end

    def set_tenant
      @tenant=Tenant.find(params[:tenant_id])
    end

    def set_course
      @course=Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_list_params
      params.require(:shift_list).permit(:course_id, :tenant_id, :start_at, :end_at, :note,worker_ids:[])
    end
end
