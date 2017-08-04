class Crate < ActiveRecord::Base
	belongs_to :from_pmu ,:class_name => 'Pmu'
	belongs_to :to_pmu,:class_name => 'Pmu'
	belongs_to :driver
end
