class Purchase < ActiveRecord::Base
	belongs_to :pmu

	def details
		"#{pmu.grower.name} - #{pmu.village} #{pmu.location}"
	end
end
