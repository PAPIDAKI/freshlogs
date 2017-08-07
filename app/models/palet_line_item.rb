class PaletLineItem < ActiveRecord::Base
	belongs_to :lot
	belongs_to :palet
	accepts_nested_attributes_for :lot,:reject_if=>:all_blank 
	# validates_presence_of :palet

	def current
		self.where('created_at BETWEEN ? AND ?',
     Time.zone.now.beginning_of_year,Time.zone.now.end_of_year).order(created_at: :desc)
	end
end
