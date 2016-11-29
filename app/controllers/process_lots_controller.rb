class ProcessLotsController < ApplicationController
  before_action :set_process_lot, only: [:show, :edit, :update, :destroy]

  # GET /process_lots
  # GET /process_lots.json
  def index
    @process_lots = ProcessLot.all
  end

  # GET /process_lots/1
  # GET /process_lots/1.json
  def show
  end

  # GET /process_lots/new
  def new
    @process_lot = ProcessLot.new
  end

  # GET /process_lots/1/edit
  def edit
  end

  # POST /process_lots
  # POST /process_lots.json
  def create
    @process_lot = ProcessLot.new(process_lot_params)

    respond_to do |format|
      if @process_lot.save
        format.html { redirect_to @process_lot, notice: 'Process lot was successfully created.' }
        format.json { render :show, status: :created, location: @process_lot }
      else
        format.html { render :new }
        format.json { render json: @process_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /process_lots/1
  # PATCH/PUT /process_lots/1.json
  def update
    respond_to do |format|
      if @process_lot.update(process_lot_params)
        format.html { redirect_to @process_lot, notice: 'Process lot was successfully updated.' }
        format.json { render :show, status: :ok, location: @process_lot }
      else
        format.html { render :edit }
        format.json { render json: @process_lot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /process_lots/1
  # DELETE /process_lots/1.json
  def destroy
    @process_lot.destroy
    respond_to do |format|
      format.html { redirect_to process_lots_url, notice: 'Process lot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_process_lot
      @process_lot = ProcessLot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def process_lot_params
      params.require(:process_lot).permit(:date, :lot, :quantity, :note)
    end
end
