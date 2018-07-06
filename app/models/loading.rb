# == Schema Information
#
# Table name: loadings
#
#  id             :integer          not null, primary key
#  date           :datetime
#  customer       :string
#  eta            :date
#  delivered      :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tenant_id      :integer
#  order_no       :string
#  purchase_order :string
#

class Loading < ActiveRecord::Base
	has_many :palets,dependent: :nullify
	has_many :palet_line_items,through: :palets
	has_many :lots ,through: :palet_line_items
	validates :customer,presence: true

 
 class TrueClass
  def yesno
    "Yes"
  end
end

class FalseClass
  def yesno
    "No"
  end
end
	
end
