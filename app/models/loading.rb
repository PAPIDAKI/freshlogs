class Loading < ActiveRecord::Base
	has_many :palets
	has_many :palet_line_items,through: :palets
	has_many :lots ,through: :palet_line_items
end
