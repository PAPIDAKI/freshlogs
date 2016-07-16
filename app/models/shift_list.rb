class ShiftList < ActiveRecord::Base
	belongs_to :course
	has_many :attendances,dependent: :destroy
	has_many :workers,through: :attendances

	# accepts_nested_attributes_for :attendances

	def hours_worked
		(end_at-start_at)/60/60
	end

end
