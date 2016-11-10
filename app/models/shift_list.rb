class ShiftList < ActiveRecord::Base
	belongs_to :tenant
	has_many :attendances,dependent: :destroy
	has_many :workers,through: :attendances
	has_many :workgroups,through: :workers

	accepts_nested_attributes_for :attendances

	def hours_worked
		(end_at-start_at)/60/60
	end

end
