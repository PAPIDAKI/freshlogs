# == Schema Information
#
# Table name: weighings
#  id           :integer          not null, primary key
#  tenant_id    :integer
#  lot_id       :integer
#  mixed_weight :integer
#  crates       :integer
#  crate_weight :integer
#  palets       :integer
#  palet_weight :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Weighing < ActiveRecord::Base
	belongs_to :lot 

	after_initialize :set_defaults
  before_validation :default_to_zero_if_necessary

   
  def net_weight
  mixed_weight-(crates*crate_weight)-(palets*palet_weight)
  end	

    def purchase_price 
    lot.purchase.price-price_difference
    end

#def net_kg
 #  mixed_weight-(crates*crate_weight)-(palets*palet_weight)
#end

    
 def self.current
    where('created_at BETWEEN ? AND ?',
     Time.zone.now.beginning_of_year,Time.zone.now.end_of_year)
 end

private
  def default_to_zero_if_necessary
    mixed_weight = 0 if mixed_weight.blank?
   crates = 0 if crates.blank?
    palets = 0 if palets..blank?
  end

  def set_defaults
    self.crate_weight = 2  if self.new_record?
    self.palet_weight =16 if self.new_record?
    # self.palets = 0 if self.new_record?

  end

end
