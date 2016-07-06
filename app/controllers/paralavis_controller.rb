class ParalavisController < ApplicationController
  before_action :set_paralavi, only: [:show, :edit, :update, :destroy]
  # before_action :set_lot

  # GET /paralavis
  # GET /paralavis.json
  def index
    @paralavis = Paralavi.all
  end

  # GET /paralavis/1
  # GET /paralavis/1.json
  def show
  end

  # GET /paralavis/new
  def new
  
    @paralavi = Paralavi.new
  
  end

  # GET /paralavis/1/edit
  def edit
  end

  # POST /paralavis
  # POST /paralavis.json
  def create

    @paralavi = Paralavi.new(paralavi_params)
    # @paralavi.lot=@lot.lot

    respond_to do |format|
      if @paralavi.save
        format.html { redirect_to @paralavi, notice: 'Paralavi was successfully created.' }
        format.json { render :show, status: :created, location: @paralavi }
      else
        format.html { render :new }
        format.json { render json: @paralavi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paralavis/1
  # PATCH/PUT /paralavis/1.json
  def update
    respond_to do |format|
      if @paralavi.update(paralavi_params)
        format.html { redirect_to @paralavi, notice: 'Paralavi was successfully updated.' }
        format.json { render :show, status: :ok, location: @paralavi }
      else
        format.html { render :edit }
        format.json { render json: @paralavi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paralavis/1
  # DELETE /paralavis/1.json
  def destroy
    @paralavi.destroy
    respond_to do |format|
      format.html { redirect_to paralavis_url, notice: 'Paralavi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paralavi
      @paralavi = Paralavi.find(params[:id])
    end

    def set_lot
        @lot=Lot.create!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paralavi_params
      params.require(:paralavi).permit(:lot, :plastics, :kgs, :note)
    end
end
