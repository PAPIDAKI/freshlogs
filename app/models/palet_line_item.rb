# == Schema Information
#
# Table name: palet_line_items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  palet_id   :integer
#  lot_id     :integer
#  cartons    :integer
#  tenant_id  :integer
#

class PaletLineItem < ActiveRecord::Base
	belongs_to :lot
	belongs_to :palet
	accepts_nested_attributes_for :lot,:reject_if=>:all_blank 
	# validates_presence_of :palet

	def self.current
    where('created_at BETWEEN ? AND ?',
     Time.zone.now.beginning_of_year,Time.zone.now.end_of_year)
	  end

	def current
		self.where('created_at BETWEEN ? AND ?',
     Time.zone.now.beginning_of_year,Time.zone.now.end_of_year).order(created_at: :desc)
	end
end
