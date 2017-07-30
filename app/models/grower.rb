class Grower < ActiveRecord::Base
	belongs_to :project
	belongs_to :tenant
	has_many :pmus ,dependent: :destroy
	has_many :purchases,through: :pmus
	has_many :lots,through: :purchases
	has_many :loose_berries,through: :purchases
	has_many :palet_line_items,through: :lots
	has_many :palets,through: :palet_line_items
	has_many :loadings,through: :palets

	def grower_details
		"#{name} - #{address}"
	end

	def lots_2016
		self.lots.where('lots.created_at BETWEEN ? AND ?', '01/01/2016','12/31/2016')
	end

	def lots_2017
		self.lots.where('lots.created_at BETWEEN ? AND ?', '01/01/2017','12/31/2017')
	end
end
