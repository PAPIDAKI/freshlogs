class Workgroup < ActiveRecord::Base
	has_many :workgroup_workers
	has_many :workers ,through: :workgroup_workers
	has_many :attendances,through: :workers
	has_many :shift_lists , through: :attendances
	
end
