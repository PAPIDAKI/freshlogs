class Purchase < ActiveRecord::Base
	belongs_to :pmu
	has_many :loose_berries,dependent: :destroy
	has_many  :lots,dependent: :destroy
	has_many :palet_line_items,through: :lots
	has_many :palets ,through: :palet_line_items

	validates :pmu,presence: true
	

	def details
		"#{pmu.grower.name} - #{pmu.location}"
	end

end
