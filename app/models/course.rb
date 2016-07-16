class Course < ActiveRecord::Base
	has_many :shift_lists
	has_many :workers
	# has_many :attendances,through: :shift_lists

	validates :name ,presence: true,uniqueness: true
end
