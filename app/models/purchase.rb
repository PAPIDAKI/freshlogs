# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  price      :float            default(0.0)
#  note       :string
#  tenant_id  :integer
#  pmu_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  analysis   :string
#

class Purchase < ActiveRecord::Base
	belongs_to :pmu
	has_many :loose_berries,dependent: :destroy
	has_many  :lots,dependent: :destroy
	has_many :palet_line_items,through: :lots
	has_many :palets ,through: :palet_line_items

	validates :pmu,presence: true
	

	def details
		"#{pmu.grower.name}- #{pmu.location}"
		# "HEllo fm details"
	end

	def self.current
		where('created_at BETWEEN ? AND ?',
		 Time.zone.now.beginning_of_year,Time.zone.now.end_of_year)
	end


# Methods used in  grower- position 
	def lots_count		
       lots.count
    end

   def weight_in
   	  lots.sum(:kg)
   	 end

   	def weight_out
     palet_line_items.sum(:cartons)*5
	  end

	 def missing_kgs
	 	weight_in-weight_out
	 end

	 def fyra_percent
	 	missing_kgs/weight_in.to_f*100
	 end




end
