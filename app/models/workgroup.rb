# == Schema Information
#
# Table name: workgroups
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :integer
#

class Workgroup < ActiveRecord::Base
	has_many :workgroup_workers
	has_many :workers ,through: :workgroup_workers
	has_many :attendances,through: :workers
	has_many :shift_lists , through: :attendances
	
end
