# == Schema Information
#
# Table name: shift_lists
#
#  id         :integer          not null, primary key
#  tenant_id  :integer
#  start_at   :datetime
#  end_at     :datetime
#  note       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#

class ShiftList < ActiveRecord::Base
	belongs_to :tenant
	has_many :attendances,dependent: :destroy
	has_many :workers,through: :attendances
	has_many :workgroups,through: :workers

	accepts_nested_attributes_for :attendances
    validates :break_time, presence: true,numericality: { only_integer: true }


	scope :fields_lists, -> {where(type:'FieldsList')}

    def hours_present
      (end_at-start_at)/60/60
    end

	def hours_worked
        (end_at-start_at)/60/60-break_time/60
     end



# instance methods to seperate the shiftlist by worker_hasher kind used in 
# shift_list/show to mape it easier to read and calculations

    def packhouse
    workers.where(kind:'Packhouse')
    end

    def fields
    workers.where(kind:'Fields')
    end
    
    def drivers
    workers.where(kind:'Driver')
    end

    def field_supervisors
    workers.where(kind:'Field Supervisor')
    end
end
