class Grower < ActiveRecord::Base
	belongs_to :project
	belongs_to :tenant
	has_many :pmus
	has_many :purchases,through: :pmus
	has_many :lots,through: :purchases
	has_many :palet_line_items,through: :lots
	has_many :palets,through: :palet_line_items
	has_many :loadings,through: :palets

	def grower_details
		"#{name} - #{address}"
	end
end
