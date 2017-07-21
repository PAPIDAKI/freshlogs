class Lot < ActiveRecord::Base
  
	belongs_to :purchase
  has_many :palet_line_items,dependent: :destroy
  has_many :palets, through: :palet_line_items
  has_many :loadings,through: :palets
  accepts_nested_attributes_for :palet_line_items
  accepts_nested_attributes_for :palets



 


	 before_validation :set_default_lot, unless: :persisted?
  # The set_defaults will only work if the object is new
  def set_default_lot
  	lot_date_time=DateTime.now
  	a_part=lot_date_time.strftime("D%d")
  	b_part=lot_date_time.strftime("%H%M")
  	c_part=lot_date_time.strftime("%uM%m")

    self.lot  ||="#{a_part}#{b_part}#{c_part}"
  end

  def lot_description
    "#{lot}   #{purchase.pmu.grower.name}-#{purchase.pmu.location}"
 end

 def worth
  if purchase
  self.kg * self.purchase.price/100
    else 
   0
   end
  end

  def loose_berries
     (1-self.palet_line_items.sum(:cartons)*5.00/self.kg)*100
  end

end

