class Lot < ActiveRecord::Base
  # acts_as_tenant
  # before_save :set_default_lot
	belongs_to :purchase
  has_many :palet_line_items
  has_many :palets, through: :palet_line_items,:class_name=>'Palet'
  has_many :loadings,through: :palets
  accepts_nested_attributes_for :palet_line_items
  accepts_nested_attributes_for :palets
  # has_one :paralavi ,dependent: :destroy



	 before_validation :set_default_lot, unless: :persisted?
  # The set_defaults will only work if the object is new
  def set_default_lot
  	lot_date_time=DateTime.now
  	a_part=lot_date_time.strftime("D%d")
  	b_part=lot_date_time.strftime("%H%M")
  	c_part=lot_date_time.strftime("%uM%m")

    self.lot  ||="#{a_part}#{b_part}#{c_part}"
  end


end
