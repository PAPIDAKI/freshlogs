class Weighing < ActiveRecord::Base
	belongs_to :lot
	after_initialize :set_defaults


  def set_defaults
    self.crate_weight = 2  if self.new_record?
    self.palet_weight =16 if self.new_record?
    # self.palets = 0 if self.new_record?

  end

    def net_weight
    	mixed_weight-(crates*crate_weight)-(palets*palet_weight)
    end	
end
