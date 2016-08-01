class PaletLineItem < ActiveRecord::Base
	belongs_to :lot
	belongs_to :palet
	accepts_nested_attributes_for :lot,:reject_if=>:all_blank 
	# validates_presence_of :palet
end
