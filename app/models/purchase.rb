class Purchase < ActiveRecord::Base
	belongs_to :pmu
	has_many :loose_berries,dependent: :destroy
	has_many  :lots,dependent: :destroy

	validates :pmu,presence: true
	

	def details
		"#{pmu.grower.name} - #{pmu.location}"
	end

	def price_to_decimal
		price/100
	end
end
