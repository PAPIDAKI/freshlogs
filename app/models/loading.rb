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
