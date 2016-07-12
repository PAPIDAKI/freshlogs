class ShiftListsController < ApplicationController
  before_action :set_shift_list, only: [:show, :edit, :update, :destroy]

  # GET /shift_lists
  # GET /shift_lists.json
  def index
    @shift_lists = ShiftList.all
  end

  # GET /shift_lists/1
  # GET /shift_lists/1.json
  def show
  end

  # GET /shift_lists/new
  def new
    @shift_list = ShiftList.new
  end

  # GET /shift_lists/1/edit
  def edit
  end

  # POST /shift_lists
  # POST /shift_lists.json
  def create
    @shift_list = ShiftList.new(shift_list_params)

    respond_to do |format|
      if @shift_list.save
        format.html { redirect_to @shift_list, notice: 'Shift list was successfully created.' }
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
        format.html { redirect_to @shift_list, notice: 'Shift list was successfully updated.' }
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
      format.html { redirect_to shift_lists_url, notice: 'Shift list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_list
      @shift_list = ShiftList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_list_params
      params.require(:shift_list).permit(:course_id, :tenant_id, :start_at, :end_at, :note)
    end
end
