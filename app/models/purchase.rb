class Purchase < ActiveRecord::Base
	belongs_to :pmu

	has_many :loose_berries,dependent: :destroy
	has_many :lots
	has_many :palet_line_items,through: :lots
	has_many :palets,through: :palet_line_items
	has_many :loadings,through: :palets

	def details 
		"#{pmu.grower.name} - #{pmu.village} (#{pmu.location})"
	end
end
