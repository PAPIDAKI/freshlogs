# == Schema Information
#
# Table name: paralavis
#
#  id         :integer          not null, primary key
#  lot_id     :integer
#  plastics   :integer
#  kgs        :integer
#  note       :string
#  tenant_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Paralavi < ActiveRecord::Base
	# belongs_to :lot 
end
