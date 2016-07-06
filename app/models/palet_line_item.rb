class PaletLineItem < ActiveRecord::Base
	belongs_to :lot
	belongs_to :palets
	accepts_nested_attributes_for :lot,:reject_if=>:all_blank
end
