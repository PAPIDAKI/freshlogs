class Purchase < ActiveRecord::Base
	belongs_to :pmu

	validates :pmu,presence: true
	

	def details
		"#{pmu.grower.name} - #{pmu.village} #{pmu.location}"
	end
end
