class PaletsController < ApplicationController
  before_action :set_tenant
  before_action :set_palet, only: [:show, :edit, :update, :destroy]
  
  def index
    @palets = Palet.where(tenant_id:@tenant.id).order(code: :desc)
    # @palet_line_items=PaletLineItem.where(tenant_id:@tenant.id)
    # @total_cartons=@palet_line_items.sum(:cartons)
    # @kg_packed=@total_cartons*5
    @cartons=PaletLineItem.where(tenant_id:@tenant.id).sum(:cartons)
  end 

  def report
    # @palets = Palet.where(tenant_id:@tenant.id)order(date: :desc))
    # @total_kgs=@palets.count*960/2
    # @palets_by_grower

  end
  
  def show
    @palet=Palet.find(params[:id])
    @lots=@palet.lots
    @palet_line_items=@palet.palet_line_items
  end

 
  def new
    @palet = Palet.new
    @palet_line_item=@palet.palet_line_items.new
    # @palet_line_item=@palet.palet_line_items.new
    @palet_line_item.tenant_id=params[:tenant_id]

  end

  def edit
  end

  
  def create
    @palet = Palet.new(palet_params)
    @palet.tenant_id=@tenant.id
    # @palet.palet_line_items.last.tenant_id=params[:tenant_id]
        @palet.palet_line_items.each do |pli|
          pli.tenant_id=params[:tenant_id]
        end
    respond_to do |format|
      if @palet.save
        format.html { redirect_to tenant_palets_path(@tenant), notice: 'Palet was successfully created.' }
        format.json { render :show, status: :created, location: @palet }
      else
        format.html { render :new }
        format.json { render json: @palet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /palets/1
  # PATCH/PUT /palets/1.json
  def update
    respond_to do |format|
      if @palet.update(palet_params)
        format.html { redirect_to tenant_palets_path(@tenant,@palet), notice: 'Palet was successfully updated.' }
        format.json { render :show, status: :ok, location: @palet }
      else
        format.html { render :edit }
        format.json { render json: @palet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /palets/1
  # DELETE /palets/1.json
  def destroy
    @palet.destroy
    respond_to do |format|
      format.html { redirect_to tenant_palets_path, notice: 'Palet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_palet
      @palet = Palet.find(params[:id])
    end
    def set_tenant
      @tenant=Tenant.find(params[:tenant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def palet_params
      params.require(:palet).permit(:date,:code,:note,:tenant_id,:loading_id,:packed_for,palet_line_items_attributes: [:id,:lot_id, :palet_id,:cartons,:_destroy,:tenant_id]) 
    end
end
