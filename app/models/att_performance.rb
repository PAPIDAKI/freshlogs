# == Schema Information
#
# Table name: att_performances
#
#  id             :integer          not null, primary key
#  attendance_id  :integer
#  tenant_id      :integer
#  work_position  :string
#  cartons_packed :integer
#  late_arrival   :datetime
#  early_leave    :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AttPerformance < ActiveRecord::Base
		belongs_to :attendance
end
