# == Schema Information
#
# Table name: lots
#
#  id          :integer          not null, primary key
#  purchase_id :integer
#  lot         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tenant_id   :integer
#  kg          :integer          default(0)
#  plastics    :string
#  note        :string
#  crates      :integer
#

class Lot < ActiveRecord::Base
  belongs_to :purchase
  has_many :loadings,through: :palets
  has_many :palet_line_items,dependent: :destroy
  # accepts_nested_attributes_for :palet_line_items
  # accepts_nested_attributes_for :palets
  has_many :palets, through: :palet_line_items
  has_many :weighings ,inverse_of: :lot, dependent: :destroy
  # accepts_nested_attributes_for :weighings,reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :weighings,
                                  reject_if: proc { |attributes| attributes.any? { |key, value| key == '_destroy' || value.blank? } },
                                  allow_destroy: true                                 
  after_initialize :set_default_lot, unless: :persisted?
  # before_validation :purchase_default_to_seu_if_necessary
  validates :purchase_id ,presence: true 
   def set_default_lot
  	lot_date_time=DateTime.current
  	a_part=lot_date_time.strftime("D%d")
  	b_part=lot_date_time.strftime("%H%M")
  	c_part=lot_date_time.strftime("%uM%m")
    self.lot  ||="#{a_part}#{b_part}#{c_part}" if self.new_record?
    #set crate default 0 to avoid crashing 
    self.crates =0 if self.new_record?

   end

 def purchase_default_to_seu_if_necessary
   purchase_id = 122 if purchase_id.blank?
 end 

  def lot_description
    "#{lot}   #{purchase.pmu.grower.name}-#{purchase.pmu.location}"
  end

 def self.current
    where('created_at BETWEEN ? AND ?',
     Time.zone.now.beginning_of_year,Time.zone.now.end_of_year)
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

