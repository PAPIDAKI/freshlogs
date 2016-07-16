class Worker < ActiveRecord::Base
	belongs_to :course
	has_many :attendances
	has_many :shift_lists,through: :attendances

end
