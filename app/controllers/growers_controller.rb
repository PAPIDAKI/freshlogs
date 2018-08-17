class GrowersController < ApplicationController
  before_action :set_tenant
  before_action :set_grower, only: [:show, :edit, :update, :destroy]

  # GET /growers
  # GET /growers.json
  def index
    @growers = Grower.all.includes(:lots,:purchases,:pmus).where(tenant_id:params[:tenant_id]).order(name: :asc)
#   @growers =Grower.all.where(tenant_id:params[:tenant_id]).order(name: :asc)
  end

  def position
    @grower=Grower.find(params[:grower_id])
    case params[:scope]
    when 'last_year'
      @grower_lots=@grower.includes(:lots).last_year_lots.order(created_at: :desc)
     else 
      @grower_lots=@grower.current_year_lots.order(created_at: :desc)
    end
    @purchase_prices=@grower_lots.map {|l| l.purchase.price}
    # @grower_purchases_lots=@grower.purchases.map {|p| p.lots}
    @grower_purchases=@grower.purchases.where('purchases.created_at BETWEEN ? AND ?',
     Time.zone.now.beginning_of_year,Time.zone.now.end_of_year).order(created_at: :desc)
  end

  def last_year_position
     @grower=Grower.find(params[:grower_id])

    @purchase_prices=@grower_lots.map {|l| l.purchase.price}
    @grower_purchases=@grower.purchases


  end




  def xposition
    # @growers=Grower.where(tenant_id:params[:teant_id])
    @lots=Lot.where(tenant_id:params[:tenant_id]).sum(:kg)
    @kgs_packed=PaletLineItem.where(tenant_id:params[:tenant_id]).sum(:cartons)*5
    @fyra=@kgs_packed-@lots
    @fyra_percent=@kgs_packed/@lots

  end



  # GET /growers/1
  # GET /growers/1.json
  def show
    @pmus=Pmu.where(grower_id:params[:id])
  end

  # GET /growers/new
  def new    
    @grower = Grower.new
    @grower.tenant_id=params[:tenant_id]

  end

  # GET /growers/1/edit
  def edit
  end

  # POST /growers
  # POST /growers.json
  def create
    @grower = Grower.new(grower_params)
    @grower.tenant_id=params[:tenant_id]

    respond_to do |format|
      if @grower.save
        format.html { redirect_to tenant_growers_path , notice: 'Grower was successfully created.' }
        format.json { render :show, status: :created, location: @grower }
      else
        format.html { render :new }
        format.json { render json: @grower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /growers/1
  # PATCH/PUT /growers/1.json
  def update
    respond_to do |format|
      if @grower.update(grower_params)
        format.html { redirect_to tenant_growers_path(@tenant,@grower), notice: 'Grower was successfully updated.' }
        format.json { render :show, status: :ok, location: @grower }
      else
        format.html { render :edit }
        format.json { render json: @grower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /growers/1
  # DELETE /growers/1.json
  def destroy
    @grower.destroy
    respond_to do |format|
      format.html { redirect_to tenant_growers_path, notice: 'Grower was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_tenant
    @tenant=Tenant.find(params[:tenant_id])
    end

    def set_grower
      @grower = Grower.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
      def grower_params
      params.require(:grower).permit(:name, :address, :phone, :mobile, :vat, :picture,:ggn)
    end
end
