# == Schema Information
#
# Table name: agreements
#
#  id         :integer          not null, primary key
#  year       :string
#  payble     :float
#  note       :string
#  tenant_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Agreement < ActiveRecord::Base
  belongs_to :shift_list
  has_many :worker_agreements
  has_many :workers,through: :worker_agreements
  # worker_agreements_
end
