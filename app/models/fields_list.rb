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

class FieldsList < ShiftList
	has_many :attendances
	has_many :workers ,through: :attendances
end
