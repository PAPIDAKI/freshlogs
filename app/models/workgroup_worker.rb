class WorkgroupWorker < ActiveRecord::Base
	belongs_to :workgroup
	belongs_to :worker
end
