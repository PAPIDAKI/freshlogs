class Weighing < ActiveRecord::Base
	belongs_to :lot
	after_initialize :set_defaults
  before_validation :default_to_zero_if_necessary

  def net_weight
  	mixed_weight-(crates*crate_weight)-(palets*palet_weight)
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
