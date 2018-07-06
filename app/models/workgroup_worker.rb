# == Schema Information
#
# Table name: workgroup_workers
#
#  id           :integer          not null, primary key
#  workgroup_id :integer
#  worker_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class WorkgroupWorker < ActiveRecord::Base
	belongs_to :workgroup
	belongs_to :worker
end
