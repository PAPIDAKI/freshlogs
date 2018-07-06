# == Schema Information
#
# Table name: crates
#
#  id          :integer          not null, primary key
#  tenant_id   :integer
#  from_pmu_id :integer
#  to_pmu_id   :integer
#  crates      :integer
#  note        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  worker_id   :integer
#

class Crate < ActiveRecord::Base
	belongs_to :from_pmu ,:class_name => 'Pmu'
	belongs_to :to_pmu,:class_name => 'Pmu'
	belongs_to :worker
end
