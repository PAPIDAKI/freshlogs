# == Schema Information
#
# Table name: loose_berries
#
#  id          :integer          not null, primary key
#  purchase_id :integer
#  tenant_id   :integer
#  kg          :float
#  note        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date        :datetime
#

class LooseBerry < ActiveRecord::Base
	belongs_to :purchase
end
