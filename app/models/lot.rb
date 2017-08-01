class Lot < ActiveRecord::Base
	belongs_to :purchase
  has_many :loadings,through: :palets
  has_many :palet_line_items,dependent: :destroy
  # accepts_nested_attributes_for :palet_line_items
  # accepts_nested_attributes_for :palets
  has_many :palets, through: :palet_line_items
  has_many :weighings ,inverse_of: :lot, dependent: :destroy
  accepts_nested_attributes_for :weighings,reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :weighings,
  #                                 reject_if: proc { |attributes| attributes.any? { |key, value| key == '_destroy' || value.blank? } },
  #                                 allow_destroy: true 
                                  
  before_validation :set_default_lot, unless: :persisted?
  # after_initialize :set_default_lot
  # The set_defaults will only work if the object is new
  def set_default_lot
  	lot_date_time=DateTime.current
  	a_part=lot_date_time.strftime("D%d")
  	b_part=lot_date_time.strftime("%H%M")
  	c_part=lot_date_time.strftime("%uM%m")

    self.lot  ||="#{a_part}#{b_part}#{c_part}" if self.new_record?
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

# after_initialize :set_defaults


#   def set_defaults
#     self.crate_weight = 2  if self.new_record?
#     self.palet_weight =17 if self.new_record?
#     self.palets = 1 if self.new_record?

#   end

