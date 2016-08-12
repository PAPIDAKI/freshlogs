class ReportsController < ApplicationController
		before_action :load_growers,:load_pmus,:load_purchases,:load_lots,:load_palet_line_items
		before_action :load_palets,:load_loadings

	def index
		@kgs_in=@lots.sum(:kg)
		@kgs_packed=@palet_line_items.sum(:cartons)*5
		@fyra=@kgs_packed-@kgs_in
		@fyra_percentage=@fyra/@kgs_in
		

		
	end





	private

	def load_growers
		@growers=Grower.where(tenant_id:params[:tenant_id])
	end

	def load_pmus
		@pmus=Pmu.where(tenant_id:params[:tenant_id])
	end

	def load_purchases
		@purchases=Purchase.where(tenant_id:params[:tenant_id])
	end

	def load_lots
		@lots=Lot.where(tenant_id:params[:tenant_id])
	end

	def load_palet_line_items
		@palet_line_items=PaletLineItem.where(tenant_id:params[:tenant_id])
	end

	def load_palets
		@palet=Palet.where(tenant_id:params[:tenant_id])
	end

	def load_loadings
		@loadiing=Loading.where(tenant_id:params[:tenant_id])
	end
			

end
