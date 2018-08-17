# == Schema Information
#
# Table name: growers
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  phone      :string
#  mobile     :string
#  vat        :string
#  picture    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#  tenant_id  :integer
#  ggn        :string
#

class Grower < ActiveRecord::Base
	belongs_to :project
	belongs_to :tenant
	has_many :pmus,dependent: :destroy
	has_many :purchases,through: :pmus
	has_many :lots,through: :purchases
	has_many :loose_berries,through: :purchases
	has_many :palet_line_items,through: :lots
	has_many :palets,through: :palet_line_items
	has_many :loadings,through: :palets

	def grower_details
		"#{name} - #{address}"
	end

	def current_year_lots
		self.lots.where('lots.created_at BETWEEN ? AND ?',
		 Time.zone.now.beginning_of_year,Time.zone.now.end_of_year)
	end

	# def current_month
	# 	self.lots.where('lots.created_at BETWEEN ? AND ?', Time.zone.now.beginning_of_month,Time.zone.now.end_of_month)
	# end

	def last_year_lots
		self.lots.where('lots.created_at BETWEEN ? AND ?',
		 Time.zone.now.beginning_of_year-1.year,Time.zone.now.end_of_year-1.year)
	end



end
